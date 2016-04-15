class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

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
    @post = Post.new(title: params[:post][:title],
                     text:  params[:post][:text],
                     user_id: current_user.id)
    authorize @post
    if @post.save
      @post.tags << Tag.find(params[:tag])
      render 'show'
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'new'
    end
  end

  def update
    authorize @post
    if Post.update_post(@post, params[:post])
      render 'show'
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'edit'
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

end