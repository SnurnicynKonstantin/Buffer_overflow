class AddInsertedCount < ActiveRecord::Migration
  def change
    add_column :comments, :inserted_count, :integer, :default => 0
  end
end
