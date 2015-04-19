class TimerController < ApplicationController

	def timer
		if logged_in?
			@log = Log.new
			@log.result = true;
		end
	end

end
