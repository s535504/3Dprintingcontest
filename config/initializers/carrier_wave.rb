CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAJ6AKW7GA6F4OIAIA',
    :aws_secret_access_key => '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',
    :region => 'us-west-2'
  }
  config.fog_directory     =  'ronasbucket'
end