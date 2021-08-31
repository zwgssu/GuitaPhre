class Admin::PhrasesController < Admin::Base
  def index
    @phrases = Phrase.all
  end

  def show
    @phrase = Phrase.find(params[:id])
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy
    redirect_to :admin_phrases, notice: "フレーズを削除しました。"
  end
end