require 'rails_helper'

describe PostsController do
  include Devise::TestHelpers

  before(:each) {
    @user = create(:first_user)
    create(:rails_tag)
    sign_in @user
  }

  let(:post_first) do
    {title: 'Test11', text: 'Test12', user_id: @user.id}
  end

  let(:post_second) do
    {title: 'Test21', text: 'Test22', user_id: @user.id}
  end

  it 'signined user create post' do
    post :create, post: post_first, tag_id: Tag.first.id
    expect(Post.last.title).to eq('Test11')
  end

  it 'owner can update his post' do #?
    post :create, post: post_first, tag_id: Tag.first.id
    edited_post = Post.last
    edited_post[:title] = 'Errors'
    put :update,{ id: edited_post.id, title: 'Errors'}
  end

  it 'show post by its id' do
    post :create, post: post_first, tag_id: Tag.first.id
    get :show, id: Post.last.id
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
  end

  it 'successful vote_up' do
    post :create, post: post_first, tag_id: Tag.first.id
    post :vote_up, id: Post.first.id, rating: 3
    expect(Post.first.rating).to eq(3)
  end

end