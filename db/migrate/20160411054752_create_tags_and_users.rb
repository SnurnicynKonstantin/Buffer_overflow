class CreateTagsAndUsers < ActiveRecord::Migration
  def change
    create_table :tags_users, id: false do |t|
      t.references :tag, index: true
      t.references :user, index: true
    end
  end
end
