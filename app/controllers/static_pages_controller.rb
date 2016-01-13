class StaticPagesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:notify]
  
  def home
  end

  def info
  end

  def notify
    @register = Register.new(name:"Van", email:"dark@gmail.com")
    if mac_value_ok?
      @register.save
      Transaction.find_by!(trade_number: params[:MerchantTradeNo]).update!(params: request.POST)
    end
  end

  private

    def mac_value_ok?
      params_copy = params.dup

      params_to_go = params_copy.except(:CheckMacValue, :action, :controller)

      raw_data = params_to_go.sort.map do |x,y|
        "#{x}=#{y}"
      end.join('&')

      hash_raw_data = "HashKey=#{EzAllpay.hash_key}&#{raw_data}&HashIV=#{EzAllpay.hash_iv}"

      url_encode_data = (CGI::escape(hash_raw_data)).downcase

      my_mac = Digest::MD5.hexdigest(url_encode_data)

      params_no_mac = params[:CheckMacValue]

      if my_mac ==params_no_mac.to_s.downcase
        return true
      else
        return false
      end
    end
end
