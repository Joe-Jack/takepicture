class RemoveRemoteImageUrlFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :remote_image_url, :text
  end
end
