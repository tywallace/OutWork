OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#Production
	# provider :facebook, '870290416342991', '7430ad200fe8fe61b01f3e3a556ed823', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  	
  	#Development
  	provider :facebook, '883611521677547', '299b9165fe57abd1b37599c5f5dc07e7', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end