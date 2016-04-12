class PostsController < ApplicationController
  #before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def edit
    flash[:error] = nil
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def create
    @post = Post.new(title: params[:post][:title],
                     text:  params[:post][:text],
                     user_id: current_user.id)
    if @post.save
      @post.tags << Tag.find(params[:tag])
      render 'show'
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if Post.update_post(@post, params[:post])
      render 'show'
    else
      flash[:error] = 'Впопрос и пописание не должны быть пустыми и меньше двух символов.'
      render 'edit'
    end
  end

end