class StaticPagesController < ApplicationController
  include UsersHelper
	
  def home
    if logged_in?
      # @micropost  = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      @weekly_pomos = Log.joins(:user).group(:user).where("logs.created_at >= ?", Time.zone.now.beginning_of_week).limit(10).order('count_all DESC').count
      @log = Log.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user, :vote_scope => Time.zone.today
    redirect_to root_path
  end

  def downvote
    @user = User.find(params[:id])
    @user.dislike_by current_user, :vote_scope => Time.zone.today
    redirect_to root_path
  end
end
