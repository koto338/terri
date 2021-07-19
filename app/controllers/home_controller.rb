class HomeController < ApplicationController
  def index
    @user = current_user
    @user_areas = current_user.areas
  end

  # ユーザー一覧
  def show
    @users = User.all
  end
end
