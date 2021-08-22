class PhrasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :fav_only?, only: [:show]
  def index
    @phrases = Phrase.page(params[:page]).per(6).order('created_at DESC')
  end

  def show
    @phrase = Phrase.find(params[:id])
    @comment = Comment.new
    @comments = @phrase.comments.all.order("created_at DESC")
  end

  def new
    @phrase = current_user.phrases.build
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
    redirect_to user_path(current_user), notice: "フレーズを削除しました。"
  end

  private

  def phrase_params
    params.require(:phrase).permit(
      :music_file,
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

  def fav_only?
    @phrase = Phrase.find(params[:id])
    if @phrase.user_only
      if user_signed_in?
        unless current_user == @phrase.user
          if current_user.liking_user?(@phrase.user)
            else
              redirect_to root_path
          end
        end
      else
        redirect_to root_path
      end
    end
  end

end
