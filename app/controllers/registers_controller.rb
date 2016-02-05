class RegistersController < ApplicationController

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
        @transactions = @register.transactions.find_by("params -> 'RtnCode' = '1' OR params -> 'TradeStatus' = '1'")
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
      Mail.deliver(from:'LINE DDD',to:@register.email,subject:"3D列印競賽報名成功通知",body:"您已成功報名LINE DDD主辦3D列印競賽")
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
end
