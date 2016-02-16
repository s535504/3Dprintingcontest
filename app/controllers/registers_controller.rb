class RegistersController < ApplicationController

  def index
    if params[:search] == "" || params[:n] == ""
      # redirect_to search_path
      flash[:danger]="請輸入完整資料"
    else
      if Register.find_by(email: params[:search],name: params[:n]) == nil
        redirect_to search_path
        flash[:danger]="查無此筆資料"
      else
        @register = Register.find_by(email: params[:search],name: params[:n])
        @transaction = @register.transactions.find_by("params -> 'RtnCode' = '1' OR params -> 'TradeStatus' = '1'")
        if @register.paystatus==3 && @transaction.params['PaymentType']=="Credit_CreditCard"
          @params = {}
          @params['MerchantID']="2000132"
          @params['MerchantTradeNo']=@transaction.params["MerchantTradeNo"]
          @params['TradeNo']=@transaction.params["TradeNo"]
          @params['Action']="R"
          @params['TotalAmount']=@transaction.params["TradeAmt"]
          param=create_mac
          @params['CheckMacValue']=param
        end
      end
    end
  end

  def show
    @register=Register.find(params[:id])
  end

  def new
    if params[:n] && params[:email]
      @register = Register.new(name: params[:n],email: params[:email])
    else
      redirect_to form
    end
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      @register.transactions.create
      Mail.deliver(from:'LINE DDD',to:@register.email,subject:"報名成功-LINE DDD 3D列印競賽",body:"您已成功報名LINE DDD主辦3D列印競賽")
      render 'confirm'
    else
      render 'new'
    end
  end

  def confirm
    if @register==nil
      redirect_to root_url
    end
  end

  private

    def register_params
      params.require(:register).permit(:name, :email)
    end

    def create_mac
      params_copy = @params.dup

      raw_data = params_copy.sort.map do |x,y|
        "#{x}=#{y}"
      end.join('&')

      hash_raw_data = "HashKey=#{EzAllpay.hash_key}&#{raw_data}&HashIV=#{EzAllpay.hash_iv}"

      url_encode_data = (CGI::escape(hash_raw_data)).downcase

      my_mac = Digest::MD5.hexdigest(url_encode_data).upcase
    end
end
