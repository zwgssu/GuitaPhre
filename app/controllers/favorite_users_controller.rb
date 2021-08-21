class FavoriteUsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:fav_user_id])
    current_user.favorite_user(@user)
  end

  def destroy
    @user = User.find(params[:fav_user_id])
    current_user.unfavorite_user(@user)
  end

end
