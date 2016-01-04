class RegistersController < ApplicationController
  def new
    @sf = Register.new
  end

  def create
    @order = Register.new(register_params)
    if @order.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def register_params
      params.require(:register).permit(:name, :email)
    end
end
