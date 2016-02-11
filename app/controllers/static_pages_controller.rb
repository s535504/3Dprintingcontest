class StaticPagesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:notify]
  
  def home
  end

  def info
  end

  def notify
    if mac_value_ok?
      Transaction.find_by!(trade_number: params[:MerchantTradeNo]).update!(params: request.POST)
      # @MerchantTradeNo=params[:MerchantTradeNo]
      # sendEmail
      id=Transaction.find_by(trade_number: params[:MerchantTradeNo]).register_id
      email=Register.find_by(id:id).email
      Mail.deliver(from:'LINE DDD',to:email,subject:"3D列印競賽繳費成功通知",body:"您已於歐付寶成功支付LINE DDD主辦3D列印競賽報名費用")
    end
  end

  def check_email
    @register = Register.find_by_email(params[:email])

    respond_to do |format|
      format.json { render :json => !@register }
    end
  end

  private

    def sendEmail
      id=Transaction.find_by(trade_number:@MerchantTradeNo).register_id
      email=Register.find_by(email:id).email
      Mail.deliver(from:'LINE DDD',to:email,subject:"3D列印競賽繳費成功通知",body:"您已於歐付寶成功支付LINE DDD主辦3D列印競賽報名費用")
    end

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
