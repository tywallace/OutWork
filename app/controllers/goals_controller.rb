class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def create
		@goal = current_user.goals.build(goal_params)
	    if @goal.save
	      flash[:success] = "Goal created!"
	      redirect_to root_url
	    elsif @goal.content.length > 25
	      @goal = []
	      flash[:danger] = "Your message is too long (Max 25 characters)"
	      redirect_to root_url
	    else
	      @goal = []
	      flash[:danger] = "Give yourself a goal"
	      redirect_to root_url
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
      params.require(:goal).permit(:content, :number)
    end
end
