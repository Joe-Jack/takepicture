class AddPicToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :pic, :text
  end
end
