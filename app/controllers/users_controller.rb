class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @users = User.page(params[:page]).per(6).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end
end