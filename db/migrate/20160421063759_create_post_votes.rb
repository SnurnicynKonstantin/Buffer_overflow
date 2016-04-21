class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :postratings do |t|
      t.string :user_id
      t.integer :post_id
      t.integer :value
      t.timestamps
    end

    add_index :postratings, [:user_id, :post_id], :unique => true
    add_index :postratings, :user_id
    add_index :postratings, :post_id
  end
end
