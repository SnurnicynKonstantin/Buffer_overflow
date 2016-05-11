class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.joins(:tags).where('tag_id = ?', params[:tag_id]).decorate
  end

  def new
    authorize Post
    @post = Post.new
    @title = t('post_show.ask')
  end

  def edit
    authorize @post
    @title = t('post_show.edit')
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
      flash.now[:error] = t('error.question')
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
      flash.now[:error] = t('error.question')
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