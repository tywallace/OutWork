class LogsController < ApplicationController

	# Process 'Log results' form
	def create
		is_completed = params[:log][:result] unless params[:log].nil?

		if is_completed == "true"
			@log = Log.new(log_create_params)
			if @log.save
				current_user.logs << @log
				redirect_to :back
			else # save failed
				redirect_to :back
			end
		else # pomodoro not completed
			redirect_to :back
		end
	end

	private
	def log_create_params
		params.require(:log).permit(:result)
	end
	def log_update_result_params
		params.require(:log).permit(:task)
	end
end
