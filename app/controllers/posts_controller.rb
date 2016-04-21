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
    authorize Post
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

    # def vote_for_post(value)
    #   rating = Postratings.new(user_id: current_user.id,
    #                      post_id: @post.id,
    #                      value: value)
    #   if rating.save
    #     ratings = Postratings.where(post_id: @post.id)
    #     rating = 0
    #     ratings.each_with_index { |val,index|
    #       rating += val.value.to_f
    #       rating /= index + 1 if(index == ratings.size - 1)}
    #     p "Value #{rating}"
    #   end
    #   @post.update_attributes(rating: rating)
    #   p "Post rating: #{@post.rating}"
    # end
end