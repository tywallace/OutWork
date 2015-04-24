module UsersHelper


  def set_state()
  	    session[:state] = 1 if session[:state].nil?
  end

  def profile_pic(user)
    "http://graph.facebook.com/#{user.uid}/picture?type=large"
  end

  def small_pic(user)
    "http://graph.facebook.com/#{user.uid}/picture?type=small"
  end

  #Return a user's goal
  def todays_goal(user)
    goal = Goal.where("created_at >= ? AND user_id = ?", Time.zone.now.beginning_of_day, user.id).last
    if goal.nil?
    	todays_goal = "No Goal"
    else
    	todays_goal = goal.content
    end
  end

    #Return a count of the user's pomodoros
  def todays_pomos(user)
      todays_pomos = Log.where("created_at >= ? AND user_id = ?", Time.zone.now.beginning_of_day, user.id).count
  end
end