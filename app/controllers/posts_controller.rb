class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.joins(:tags).where('tag_id = ?', params[:format]).decorate
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
    authorize @post
    flash[:error] = nil
  end

  def show
    authorize @post
    @user = User.find(@post.user_id)
  end

  def create
    authorize Post
    @post = Post.new(post_params)

    @post.tags << Tag.find(params[:tag_id])
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'new'
    end
  end

  def vote_up
    @post = Post.find(params[:id])
    if @post
      @rating = Post.vote_for_post(params[:rating], @post, current_user)
    else
      render nothing: true, status: 200
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'edit'
    end
  end

  private
    def set_post
      @post = Post.find(params[:id]).decorate
    end

    def post_params
      params.require(:post).permit(:title, :text, :user_id)
    end
end