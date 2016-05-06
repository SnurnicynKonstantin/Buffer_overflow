class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @title = t('tag.header')
  end

  def create
    Tag.create(tag_name: params[:tag_name])
  end
end