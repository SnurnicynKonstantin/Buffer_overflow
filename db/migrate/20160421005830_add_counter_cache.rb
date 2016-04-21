class AddCounterCache < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, :default => 0
    Post.all.each { |post| Post.update(post.id, :comments_count => post.comments.length)}
  end
end
