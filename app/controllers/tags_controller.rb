class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @posts = Post.joins(:tags).where('tag_id = ?', params[:id]).decorate
  end

  def create
    Tag.create(tag_name: params[:tag_name])
  end
end