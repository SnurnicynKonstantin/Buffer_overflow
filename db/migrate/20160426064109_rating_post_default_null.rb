class RatingPostDefaultNull < ActiveRecord::Migration
  def change
    change_column :posts, :rating, :float, :default => 0
  end
end
