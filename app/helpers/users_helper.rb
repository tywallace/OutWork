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
end