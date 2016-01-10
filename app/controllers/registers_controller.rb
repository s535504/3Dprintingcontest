class RegistersController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:notify]

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
