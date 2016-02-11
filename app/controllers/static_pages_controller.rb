class StaticPagesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:notify]
  
  def home
  end

  def info
  end

  def notify
    if mac_value_ok?
      trans=Transaction.find_by!(trade_number: params[:MerchantTradeNo])
      trans.update!(params: request.POST)
      if trans.params['RtnCode']==300
        Mail.deliver(from:'LINE DDD',to:Register.find_by(id:trans.register_id).email,subject:"繳費成功-LINE DDD 3D列印競賽",body:"您已於歐付寶成功支付LINE DDD主辦3D列印競賽報名費用")
      else
        Mail.deliver(from:'LINE DDD',to:Register.find_by(id:trans.register_id).email,subject:"繳費金額有誤-LINE DDD 3D列印競賽",body:"您於歐付寶支付之金額與LINE DDD主辦3D列印競賽報名費有誤差")
      end
    end
  end

  def check_email
    @register = Register.find_by_email(params[:email])

    respond_to do |format|
      format.json { render :json => !@register }
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
