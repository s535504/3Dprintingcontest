class AddPictureToTdmfiles < ActiveRecord::Migration
  def change
    add_column :tdmfiles, :picture1, :string
    add_column :tdmfiles, :picture2, :string
    add_column :tdmfiles, :picture3, :string
  end
end
