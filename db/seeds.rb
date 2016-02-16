register=Register.create!(name:"羅那",
                 email:"s5355049@gmail.com",
                 merchant_trade_no: "TDPC20160210317402",
                 paystatus:3)
register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"300", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})

register=Register.create!(name:"Van",
                 email:"jhgf201@gmail.com",
                 merchant_trade_no: "TDPC20160210317401",
                 paystatus:1)
register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"1", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})

99.times do |n|
  name = "example-#{n+1}"
  email = "example-#{n+1}@example.com"
  merchant_trade_no = "TDPC201602103174#{n+1}"
  register=Register.create!(name: name,
                   email: email,
                   merchant_trade_no: merchant_trade_no)
  register.transactions.create
  if rand(2)==1
    register.update_attributes(paystatus:3)
    register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"300", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})
  end
end