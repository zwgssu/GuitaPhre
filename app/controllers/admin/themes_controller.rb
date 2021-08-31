class Admin::ThemesController < Admin::Base
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to :admin_themes, notice: "テーマを削除しました。"
  end
end