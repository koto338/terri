class HomeController < ApplicationController
  def index
    @user = current_user
#     @area
  end
end
