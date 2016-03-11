class AddProhibitToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :prohibit, :boolean, default: false
  end
end
