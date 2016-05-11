class SearchController < ApplicationController
  def index; end

  def search
    @posts = Post.search( params[:post_info])
  end
end