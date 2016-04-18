class CreatePostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts_tags, id: false do |t|
      t.references :tag, index: true
      t.references :post, index: true
    end
  end
end
