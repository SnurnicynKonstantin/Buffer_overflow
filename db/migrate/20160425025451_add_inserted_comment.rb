class AddInsertedComment < ActiveRecord::Migration
  def change
    add_reference :comments, :root_comment  , index: true
  end
end
