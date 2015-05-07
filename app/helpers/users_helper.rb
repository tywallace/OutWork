module UsersHelper
require 'open-uri'

  def set_state()
  	    session[:state] = 1 if session[:state].nil?
  end

  def profile_pic(user)
    if user.provider == "google_oauth2"
      picture = open("https://www.googleapis.com/plus/v1/people/#{user.uid}?fields=image&key=AIzaSyDre1mrJhF1-cSjvasAT6lTauDY0O1PduM").read()
      parsed = JSON.parse(picture)
      status = parsed["image"]["url"]
    else
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    end
  end

  def small_pic(user)
    "http://graph.facebook.com/#{user.uid}/picture?type=small"
  end

  #Return a user's goal
  def todays_goal(user)
    goal = Goal.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, user.id).last
    if goal.nil?
      return "Not Active"
    elsif goal.number == 0
      return todays_goal = "-"      
    else 
    	return goal.number
    end
  end

  #Return a user's trash talk
  def todays_status(user)
    goal = Goal.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, user.id).last
    if goal.nil?
      return nil      
    else 
      return " | " + goal.content
    end
  end

    #Return a count of the user's pomodoros
  def todays_pomos(user)
      todays_pomos = Log.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, user.id).count
  end

  #Weekly Leader
  def weekly_pomos(user)
  #    posts_per_user_count = Log.joins(:user).group(:user).order('count_all DESC').limit(10).count
  #    weekly_pomos = Log.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_week, user.id).order('count_all ASC').count
  
  end

end