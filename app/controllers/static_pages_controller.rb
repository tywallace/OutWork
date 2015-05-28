class StaticPagesController < ApplicationController
  include UsersHelper
	
  def home
    if logged_in?
      # @micropost  = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      # @logs = current_user.logs.order("created_at DESC").where("result IS NOT NULL").all
      # @goal = current_user.goals.build
      # @users = current_user.scoreboard
      @active_users = current_user.active_daily
      @weekly_pomos = Log.joins(:user).group(:user).where("logs.created_at >= ?", Time.zone.now.beginning_of_week).limit(10).order('count_all DESC').count
      @log = Log.new
      # @log.result = true;
      # @user_count = User.all.count
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
