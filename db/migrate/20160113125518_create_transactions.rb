class CreateTransactions < ActiveRecord::Migration
  def change
    execute "create extension hstore"
    create_table :transactions do |t|
      t.string :trade_number
      t.references :register, index: true, foreign_key: true
      t.hstore :params

      t.timestamps null: false
    end
    add_index :transactions, :trade_number, unique: true
  end
end