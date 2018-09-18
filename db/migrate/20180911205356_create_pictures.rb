class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text  :image_url
      t.string  :remark
      t.timestamps null: false
    end
  end
end
