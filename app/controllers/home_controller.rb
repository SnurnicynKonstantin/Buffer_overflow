class HomeController < ApplicationController
  def index
    if params[:without_answer] == 'true'
      @posts = Post.paginate(page: params[:page], per_page: 10).recent.uncommented.decorate
    else
      @posts = Post.paginate(page: params[:page], per_page: 10).recent.decorate
      #Post.paginate(:page => params[:page], :per_page => 30)
    end
  end
end