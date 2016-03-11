class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :picture
      t.string :name
      t.string :workname
      t.references :displayingwork, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :works,[:displayingwork_id]
  end
end
