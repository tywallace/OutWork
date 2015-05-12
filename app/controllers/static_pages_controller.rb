class StaticPagesController < ApplicationController
  include UsersHelper
	
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @logs = current_user.logs.order("created_at DESC").where("result IS NOT NULL").all
      @goal = current_user.goals.build
      @users = current_user.scoreboard
      @weekly_pomos = Log.joins(:user).group(:user).where("logs.created_at >= ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_week).order('count_all DESC').count
      @log = Log.new
      @log.result = true;
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
