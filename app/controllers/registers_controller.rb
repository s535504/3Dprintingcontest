class RegistersController < ApplicationController

  before_action :authenticate_user!, only:[:prohibit]

  def index
    if params[:search] == "" || params[:n] == ""
      redirect_to search_path
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
          @params['MerchantID']=ENV['MERCHANT_ID']
          @params['MerchantTradeNo']=@transaction.params["MerchantTradeNo"]
          @params['TradeNo']=@transaction.params["TradeNo"]
          @params['Action']="R"
          @params['TotalAmount']=@transaction.params["TradeAmt"]
          param=create_mac
          @params['CheckMacValue']=param
          @tdmfile=@register.tdmfiles.build
        end
      end
    end
  end

  def new
    @register = Register.new(name: params[:n],email: params[:email])
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      @register.transactions.create
      # Mail.deliver(from:'LINE DDD',to:@register.email,subject:"報名成功-LINE DDD 3D列印競賽",body:"您已成功報名LINE DDD主辦3D列印競賽")
      render 'confirm'
    else
      render 'new'
    end
  end

  def prohibit
    register=Register.find_by(email:params[:email])
    if register.prohibit==true
      register.update_attributes(prohibit:false)
    else
      register.update_attributes(prohibit:true)
    end
    redirect_to registermanagement_path
  end

  def confirm
    if @register==nil
      redirect_to root_url
    end
  end

  private

    def picture_params
      params.require(:register).permit(:picture)
    end

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
