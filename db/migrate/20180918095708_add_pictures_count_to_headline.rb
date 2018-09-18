class AddPicturesCountToHeadline < ActiveRecord::Migration
  def change
    add_column :headlines, :pictures_count, :integer
  end
end
