class HomeController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).recent
    if params[:without_answer] == 'true'
      @posts = @posts.uncommented.decorate
    else
      @posts = @posts.decorate
    end
  end
end