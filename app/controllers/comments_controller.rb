class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    if params[:comment][:root_comment_id].nil?
      @comment = @post.comments.new(comment_post_params)
    else
      @comment = Comment.new(comment_comment_params)
      @comment.post_id = 0
    end

    if @comment.save
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
    def comment_post_params
      params.require(:comment).permit(:text, :user_id)
    end

    def comment_comment_params
      params.require(:comment).permit(:text, :user_id, :root_comment_id, :inserted_count)
    end

  def set_post
    @post = Post.find(params[:post_id])
  end

end