class RegistersController < ApplicationController

  def search
    @email = ""
  end

  def searched
    @register = Register.find_by(email: @email)
    if @register == nil
      flash[:danger]="查無此筆報名"
    else
      render 'show'
    end
  end

  def show
    @register = Register.find(email: @email)
    #@register = Register.find_by(email: @register)
  end

  def new
    @register = Register.new
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      #@register.delete
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

  def notify
    mail(to: 's5355049@gmail.com', subject: "付款成功")
  end

  private

    def register_params
      params.require(:register).permit(:name, :email)
    end
end
