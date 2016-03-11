class TransactionsController < ApplicationController

  before_action :authenticate_user!

  def index
    register=Register.find_by(email: params[:email])
    @transactions = register.transactions
  end
end
