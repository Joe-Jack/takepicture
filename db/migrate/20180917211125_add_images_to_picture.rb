class AddImagesToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :images, :text
  end
end
