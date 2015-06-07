class LogsController < ApplicationController

	# Process 'Log results' form
	def create
		is_completed = params[:log][:result] 
		# unless params[:log].nil?

		if is_completed == "Yes"
			@log = Log.new(log_create_params)
			if @log.save
				current_user.logs << @log
				respond_to do |format|
			      format.html { redirect_to :back }
			      format.js
			    end
			else # save failed
				redirect_to :back
			end
		else # pomodoro not completed or nil
			redirect_to :back
		end
	end

	def edit
		@user = User.find(current_user.id)
		@logs = @user.logs.order("created_at DESC").where("result IS NOT NULL").all
		@log = Log.find(params[:id])
		@log.tag_list = params[:log][:tag_list]

		if @log.save
			respond_to do |format|
		      	format.html { redirect_to :back }
		      	format.js
		    end
		end
	end

	private
	def log_create_params
		params.require(:log).permit(:result, :tag_list)
	end
	# def log_update_result_params
	# 	params.require(:log)
	# end
end
