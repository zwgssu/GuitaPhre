class PhrasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @phrases = Phrase.page(params[:page]).per(20).order('created_at DESC')
  end

  def show
    @phrase = Phrase.find(params[:id])
  end

  def new
    @phrase = Phrase.new
  end

  def edit
  end

  def create
    @phrase = current_user.phrases.build(phrase_params)
    
    if @phrase.save
      redirect_to @phrase, notice: "フレーズを投稿しました。"
    else
      render "new"
    end
  end

  def update
    if @phrase.update(phrase_params)
      redirect_to @phrase, notice: "フレーズを更新しました。"
    else
      render "new"
    end
  end

  def destroy
    @phrase.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def phrase_params
    params.require(:phrase).permit(
      :new_music_file,
      :title,
      :body,
      :tag_1,
      :tag_2,
      :tag_3,
      :guitar,
      :user_only
    )
  end

  def correct_user
    @phrase = current_user.phrases.find_by(id: params[:id])
    unless @phrase
      redirect_to root_url
    end
  end
end
