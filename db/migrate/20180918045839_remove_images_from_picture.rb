class RemoveImagesFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :images, :text
  end
end
