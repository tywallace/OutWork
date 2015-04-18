OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '870290416342991', '7430ad200fe8fe61b01f3e3a556ed823', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end