class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find_by trad_number: params[:id]
  end
end
