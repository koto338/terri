class HomeController < ApplicationController
  def index
    @user = current_user
    @areas = Area.all
    # @visits = VisitHistory.find_by(user_id: current_user.id, area_id: area.id)
    # order('id desc')


  end
end
