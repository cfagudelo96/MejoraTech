CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['MEJORATECH_AwS_ACCESS_KEY'],
    aws_secret_access_key: ENV['MEJORATECH_AWS_SECRET_KEY'],
    region: ENV['MEJORATECH_AWS_S3_REGION'],
  }
  config.fog_directory = ENV['MEJORATECH_AWS_S3_BUCKET']
  config.fog_public = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end
