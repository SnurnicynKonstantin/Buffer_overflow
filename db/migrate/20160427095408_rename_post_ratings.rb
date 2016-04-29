class RenamePostRatings < ActiveRecord::Migration
  def change
    rename_table :postratings, :post_ratings
  end
end
