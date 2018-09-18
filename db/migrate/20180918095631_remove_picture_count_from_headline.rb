class RemovePictureCountFromHeadline < ActiveRecord::Migration
  def change
    remove_column :headlines, :picture_count, :integer
  end
end
