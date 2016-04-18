class HomeController < ApplicationController
  def index
    @posts = Post.all.decorate
  end
end