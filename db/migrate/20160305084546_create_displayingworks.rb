class CreateDisplayingworks < ActiveRecord::Migration
  def change
    create_table :displayingworks do |t|
      t.integer :col1
      t.integer :col2
      t.integer :col3
      t.integer :col4
      t.integer :col5
      t.integer :col6

      t.timestamps null: false
    end
  end
end
