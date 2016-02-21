class CreateTdmfiles < ActiveRecord::Migration
  def change
    create_table :tdmfiles do |t|
      t.string :igsfile
      t.references :register, index: true, foreign_key: true

      t.timestamps null: false
    end
    # add_index :tdmfiles, [:register_id]
  end
end
