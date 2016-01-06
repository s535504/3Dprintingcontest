class AddAttributeToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :merchant_trade_no, :string
    add_column :registers, :choose_payment, :string
  end
end
