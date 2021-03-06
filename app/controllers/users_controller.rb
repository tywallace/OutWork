class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    if params[:tag]
      @logs = @user.logs.order("created_at DESC").where("result IS NOT NULL").tagged_with(params[:tag])
      @hello = params[:tag]
    else    
      # @microposts = @user.microposts.paginate(page: params[:page])
      @logs = @user.logs.order("created_at DESC").where("result IS NOT NULL").all
    end
  end

  def new
    # @user = User.new
  end

 def create
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to root_url
    # else
    #   render 'new'
    # end
  end

  def destroy
    # User.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    # redirect_to users_url
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # if @user.update_attributes(user_params)
    #   flash[:success] = "Profile updated"
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end