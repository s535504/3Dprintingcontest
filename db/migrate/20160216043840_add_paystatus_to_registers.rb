class AddPaystatusToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :paystatus, :integer, default: 2
  end
end
