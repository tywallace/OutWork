class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def create
		@goal = current_user.goals.build(goal_params)
	    if @goal.save
	      flash[:success] = "Goal created!"
	      redirect_to root_url
	    else
	      @goal = []
	      render 'static_pages/home'
	    end
	end

	def update
	end

	# def show
	# 	@user = User.find(params[:id])
 #    	@goals = @user.goals.where(start: DateTime.now.beginning_of_day.. DateTime.now.end_of_day)
	# end

	private

	def goal_params
      params.require(:goal).permit(:goal)
    end
end
