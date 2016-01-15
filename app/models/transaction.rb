class Transaction < ActiveRecord::Base
  belongs_to :register
  after_initialize :generate_trade_number

  def to_param
    trade_number
  end

  private

    def generate_trade_number
      loop do
        self.trade_number = SecureRandom.hex(3).upcase
        break unless Transaction.where(trade_number: self.trade_number).first
      end
    end
end
