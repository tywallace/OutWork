class TimerController < ApplicationController

	def timer
		if logged_in?
			@log = Log.new
		end
	end

end
