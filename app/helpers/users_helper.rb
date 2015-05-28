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

  #Return a user's status
  def todays_status(user)
    goal = Goal.where("created_at >= ? AND user_id = ?", Date.today.beginning_of_day, user.id).last
    if goal.nil?
      return nil      
    elsif goal.content == ""
      return nil
    else
      return goal.content
    end
  end

    #Return a count of the user's pomodoros
  def log_count(day, user)
    Log.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.beginning_of_day, day.in_time_zone.end_of_day, user).count
  end

  def goal_count(day, user)
    goal = Goal.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.beginning_of_day, day.end_of_day, user).last
    if goal.nil?
      return todays_goal = "-"
    elsif goal.number == 0
      return todays_goal = "-"      
    else 
      return goal.number
    end
  end

  def daily_logs(day, user)
    Log.where("created_at >= ? AND created_at <= ? AND user_id = ?", day.beginning_of_day, day.end_of_day, user)
  end

  def daily_tags(day, logs)
    tags_array = []
    logs.each do |l|
      if l.created_at.to_date == day
          tags_array.push(l.tag_list)
      end
    end
    counts = Hash.new(0)
    tags_array.flatten.each { |name| counts[name] += 1}
    return counts  
  end

  def log_at_date(day, logs)
    logs.each do |l|
      if l.created_at.to_date == day
          return true
      end
    end
  end

end