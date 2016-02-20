CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAI4J5Q2Q2THV65ZPQ',
    :aws_secret_access_key => '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',
    :region => 'us-west-2'
  }
  config.fog_directory     =  'ronasbucket'
end