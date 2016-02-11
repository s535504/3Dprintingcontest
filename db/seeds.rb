register=Register.create!(name:"羅那",
                 email:"s5355049@gmail.com",
                 merchant_trade_no: "TDPC20160210317402")

register.transactions.create(params:{"CheckMacValue"=>"CCBD2EEF9C7D0F5E6C2AEDE2BAA1755C", "MerchantID"=>"1166567", "MerchantTradeNo"=>"B75614", "PaymentDate"=>"2016/02/11 10:20:18", "PaymentType"=>"Credit_CreditCard", "PaymentTypeChargeFee"=>"5", "RtnCode"=>"1", "RtnMsg"=>"paid", "SimulatePaid"=>"0", "TradeAmt"=>"1", "TradeDate"=>"2016/02/11 10:18:54", "TradeNo"=>"1602111018543683"})