class StaticPagesController < ApplicationController
  include UsersHelper
	
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @logs = current_user.logs.order("created_at DESC").where("result IS NOT NULL").all
      @goal = current_user.goals.build
      @users = current_user.scoreboard
      # @log = Log.new
      # @log.result = true;
      
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
