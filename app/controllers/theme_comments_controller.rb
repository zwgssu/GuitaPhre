class ThemeCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @theme = Theme.find(params[:theme_id])
    @theme_comment = ThemeComment.create(theme_comment_params)
    if @theme_comment.save
      render :index
    end
  end

  def destroy
    @theme_comment = ThemeComment.find(params[:id])
    if @theme_comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def theme_comment_params
    params.require(:theme_comment).permit(:content).merge(user_id: current_user.id, theme_id: params[:theme_id])
  end
end
