if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJXWX7NYTJCMEORWQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['outwork']
  end
end