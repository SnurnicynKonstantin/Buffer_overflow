class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @post.comments.new(comment_params)

    if @post.save
      render 'create_succes.js.coffee'
    else
      render 'create_error.js.coffee'
    end
  end

  def vote_up
    @comment = Comment.find(params[:post_id])
    current_user.vote_for(@comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :user_id)
    end

  def set_post
    @post = Post.find(params[:post_id])
  end

end