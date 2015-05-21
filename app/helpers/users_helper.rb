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
      "http://graph.facebook.com/#{user.uid}/picture?width=150&height=150"
    end
  end

  def small_pic(user)
    "http://graph.facebook.com/#{user.uid}/picture?width=50&height=50"
  end

  #Return a user's goal
  #This should be deleted
  def todays_goal(user)
    goal = Goal.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, user.id).last
    if goal.nil?
      return "Not Active Today"
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
    elsif goal.content == ""
      return nil
    else
      return " | " + goal.content
    end
  end

    #Return a count of the user's pomodoros
    # This should be deleted
  def todays_pomos(user)
      todays_pomos = Log.where("created_at >= ? AND user_id = ?", Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, user.id).count
  end

  def log_count(day, user)
    Log.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, day.end_of_day, user).count
  end

  def goal_count(day, user)
    goal = Goal.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.in_time_zone("Eastern Time (US & Canada)").beginning_of_day, day.end_of_day, user)
    # if goal.nil?
    #   return "Not Active Today"
    # elsif goal.number == 0
    #   return todays_goal = "-"      
    # else 
    #   return goal.number
    # end
  end

  def daily_logs(day, user)
    Log.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.beginning_of_day, day.end_of_day, user)
  end

  def daily_tags(day, logs)
    tags_array = []
    logs.each do |l|
      if l.created_at.to_date == day
        if l.tags != []
          tags_array.push(l.tag_list)
        end
      end
    end
    counts = Hash.new(0)
    tags_array.flatten.each { |name| counts[name] += 1}
    return counts  
  end

end