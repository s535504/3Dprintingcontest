User.create!(email:"tdpcontestadmin@gmail.com",password:"tdpcontest1234")

register=Register.create!(name:"羅那",
                 email:"s5355049@gmail.com",
                 merchant_trade_no: "TDPC20160210317402",
                 paystatus:3)
register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"300", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})

register=Register.create!(name:"Van",
                 email:"dark@gmail.com",
                 merchant_trade_no: "TDPC20160210317401",
                 paystatus:1)
register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"1", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})

register=Register.create!(name:"Billy",
                 email:"pants@gmail.com",
                 merchant_trade_no: "TDPC20160210317400",
                 paystatus:2)
register.transactions.create(params:{"CheckMacValue"=>"4556D627173E46ADD8CCF6992B74B11B", "MerchantID"=>"1166567", "MerchantTradeNo"=>"A7559C", "PaymentDate"=>"0001/01/01 00:00:00", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"10100248", "RtnMsg"=>"拒絕交易", "SimulatePaid"=>"0", "TradeAmt"=>"1", "TradeDate"=>"2016/02/21 22:44:11", "TradeNo"=>"1602212244119643"})

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

Displayingwork.create!

6.times do
  Banner.create!
end