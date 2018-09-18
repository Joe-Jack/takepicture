class RemovePicFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :pic, :text
  end
end
