class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @posts = Post.joins(:tags)#.where('tag_id = ?', 1)
    #render nothing: true, status: 200
  end

  def create
    Tag.create(tag_name: params[:tag_name])
  end
end