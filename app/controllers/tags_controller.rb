class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    p '+++++++++++++++++++++++++++++++++++++++++++++'
    @posts = Post.joins(:tags)#.where('tag_id = ?', 1)
    p '+++++++++++++++++++++++++++++++++++++++++++++' + @posts
    #render nothing: true, status: 200
  end

  def create
    Tag.create(tag_name: params[:tag_name])
  end
end