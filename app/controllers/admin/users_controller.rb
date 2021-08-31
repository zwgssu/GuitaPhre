class Admin::UsersController < Admin::Base
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :admin_users, notice: "ユーザーを削除しました。"
  end
end