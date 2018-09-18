class AddHeadlineIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :headline_id, :integer
  end
end
