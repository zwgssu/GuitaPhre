class ThemesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @themes = Theme.page(params[:page]).per(6).order('created_at DESC')
  end

  def show
    @theme = Theme.find(params[:id])
    @theme_comment = ThemeComment.new
    @theme_comments = @theme.theme_comments.all.order("created_at DESC")
  end

  def new
    @theme = current_user.themes.build
  end

  def create
    @theme = current_user.themes.build(theme_params)
    if @theme.save
      redirect_to @theme, notice: "テーマを投稿しました。"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to @theme, notice: "テーマを更新しました。"
    else
      render "new"
    end
  end

  def destroy
    @theme.destroy
    redirect_to user_path(current_user), notice: "テーマを削除しました。"
  end

  private

  def theme_params
    params.require(:theme).permit(
      :music_file,
      :title,
      :overview,
      :tag_1,
      :tag_2,
      :tag_3,
    )
  end

  def correct_user
    @theme = current_user.themes.find_by(id: params[:id])
    unless @theme
      redirect_to root_url
    end
  end
end
