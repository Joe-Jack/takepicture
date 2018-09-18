class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :name
      t.integer :picture_id
      t.timestamps null: false
    end
  end
end
