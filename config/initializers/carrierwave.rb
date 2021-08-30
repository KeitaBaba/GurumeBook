if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider      = 'fog/aws'
    config.fog_directory     =  'baba-rails-app-first-bucket'
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => 'ap-northeast-1',  # S3に設定したリージョン。
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    }
  end
else

  CarrierWave.configure do |config|
      config.storage :file
    end
end