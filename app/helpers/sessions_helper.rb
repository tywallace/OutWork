module SessionsHelper

	  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

    # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
