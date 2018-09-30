class AddNumToHeadline < ActiveRecord::Migration
  def change
    add_column :headlines, :num, :integer
  end
end
