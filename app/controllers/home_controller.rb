class HomeController < ApplicationController
  def index
    @user = current_user
    @user_areas = current_user.areas
  end
end
