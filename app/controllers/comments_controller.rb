class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

      if @comment.save
        Post.find(params[:post_id]).touch
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
      params.require(:comment).permit(:text, :user_id, :post_id)
    end

end