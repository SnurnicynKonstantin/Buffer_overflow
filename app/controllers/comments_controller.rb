class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    if params[:comment][:root_comment_id].nil?
      comment = @post.comments.new(comment_post_params)
    else
      render nothing: true, status: 200 if(params[:comment][:inserted_count].to_i >= Setting.inserted_comment_count)
      comment = Comment.new(comment_comment_params)
      comment.post_id = 0
    end
      comment.save ? (render 'create_succes.js.coffee') : (render 'create_error.js.coffee')
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