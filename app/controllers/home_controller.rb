class HomeController < ApplicationController
  def index
    if params[:without_answer] == 'true'
      @posts = Post.uncommented.decorate
    else
      @posts = Post.recent.decorate
    end
  end
end