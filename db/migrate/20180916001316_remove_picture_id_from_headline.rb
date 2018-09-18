class RemovePictureIdFromHeadline < ActiveRecord::Migration
  def change
    remove_column :headlines, :picture_id, :integer
  end
end
