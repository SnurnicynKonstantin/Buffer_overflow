require 'rails_helper'

describe CommentsController do
  include Devise::TestHelpers

  before(:each) {
    @user = create(:first_user)
    create(:rails_tag)
    sign_in @user
    # post :create, :post => post_first, tag_id: Tag.first.id
  }

  let(:post_first) do
    {title: 'Test11', text: 'Test12', user_id: @user.id}
  end

  # it 'create comment' do
  #   post :create, comment: {text: 'comment', user_id: @user.id, post_id: Post.last}
  # end

end


#проверить create
#vote_up