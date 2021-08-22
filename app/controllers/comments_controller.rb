class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @phrase = Phrase.find(params[:phrase_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, phrase_id: params[:phrase_id])
  end
end
