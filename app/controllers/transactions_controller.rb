class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.last
  end
end
