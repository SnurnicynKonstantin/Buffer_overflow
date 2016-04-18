class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: params[:comment][:text],
                           user_id: params[:comment][:user_id],
                           post_id: params[:comment][:post_id])

      if @comment.save
        #вывести джейсон новый коммент
      else
        redirect_to(:back)
      end
  end

  def vote_up
    @comment = Comment.find(params[:post_id])
    current_user.vote_for(@comment)
  end

end