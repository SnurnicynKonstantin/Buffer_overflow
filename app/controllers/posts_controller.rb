class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.joins(:tags).where('tag_id = ?', params[:format]).decorate
  end

  def new
    authorize Post
    @post = Post.new
    @title = 'Задать вопрос'
  end

  def edit
    authorize @post
    flash[:error] = nil
    @title = 'Редактирование вопроса'
  end

  def show
    authorize @post
    @user = User.find(@post.user_id)
    @title = @post.title
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

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url
  end

  def vote_up
    @post = Post.find(params[:id])
    if @post
      @rating = PostRatingCalculator.calculate(params[:rating], @post, current_user)
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