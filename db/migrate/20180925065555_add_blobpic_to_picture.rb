class AddBlobpicToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :blobpic, :blob
  end
end
