class AddPictureCountToHeadline < ActiveRecord::Migration
  def change
    add_column :headlines, :picture_count, :integer
  end
end
