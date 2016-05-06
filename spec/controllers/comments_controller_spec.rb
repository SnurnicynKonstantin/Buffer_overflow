require 'rails_helper'

describe CommentsController do
  include Devise::TestHelpers

  let(:user) { create(:first_user) }
  let(:tag)  { create(:rails_tag) }

  let(:post_first) do
    {title: 'Test11', text: 'Test12'}
  end

  before { sign_in(user)
           create(:rails_tag)
           create(:first_post)
  }

  it 'success create comment' do
    post :create, comment: {text:'Test', user_id: user.id}, post_id: Post.last.id
    expect(Comment.last.text).to eq('Test')
    expect(response.status).to eq(200)
  end

  it 'vote_up successful' do
    post :create, comment: {text:'Test', user_id: user.id}, post_id: Post.last.id
    comment = Comment.last
    xhr :post, :vote_up, post_id: comment.id
    p user.voted_on?(comment)#?
    expect(user.voted_on?(comment)).to eq(true)
  end

end


#проверить create
#vote_up