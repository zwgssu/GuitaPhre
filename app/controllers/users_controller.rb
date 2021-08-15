class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20).order('updated_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end
end