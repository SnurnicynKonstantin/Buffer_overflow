class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @title = 'Тэги'
  end

  def create
    Tag.create(tag_name: params[:tag_name])
  end
end