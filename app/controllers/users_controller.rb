class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def index
    @users = User.page(params[:page]).per(20).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @phrases = @user.phrases.page(params[:page]).per(3).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def favorite_users
    @user = current_user
    @users = @user.liking_users.page(params[:page]).per(6).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def favorite_phrases
  end
  
  def themes
    @user = User.find(params[:id])
    @themes = @user.themes.page(params[:page]).per(3).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def mypage
    @user = current_user
    @phrases = @user.feed_phrases.page(params[:page]).per(6).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end
end