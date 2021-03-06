EzAllpay.setup do |allpay|
  if Rails.env.development?
    allpay.merchant_id = '2000132'
    allpay.hash_key    = '5294y06JbISpM5x9'
    allpay.hash_iv     = 'v77hoKGq4kWxNNIS'
    allpay.choose_payment = 'Credit'
    allpay.return_url = 'http://localhost:3000/notify'
  else
    allpay.merchant_id = ENV['MERCHANT_ID']
    allpay.hash_key    = ENV['HASH_KEY']
    allpay.hash_iv     = ENV['HASH_IV']
    allpay.choose_payment = 'Credit'
    allpay.return_url = 'http://tdpcontest.herokuapp.com/notify'
  end
end