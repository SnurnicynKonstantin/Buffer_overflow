require 'rails_helper'
require 'yaml'

describe PostsController do
  include Devise::TestHelpers

  before(:each) {
    user = create_succes(:first_user)
    sign_in user
  }

  it 'sign in user create post' do
    post :create_succes, post: {title: 'Test11', text: 'Test12' }

    sdfg = Post.last
    dsfs = Post.last
  end
end