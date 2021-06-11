class HomeController < ApplicationController
  def index
    @user = current_user
    @visits = VisitHistory.where(user_id: current_user.id)
  end
end
