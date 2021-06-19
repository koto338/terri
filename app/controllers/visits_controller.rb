class VisitsController < ApplicationController
  # 訪問一覧
  def show
    @area = Area.find(params[:id])
    @user = current_user
    @visits = VisitHistory.where(user_id: current_user.id, area_id: @area.id)
  end
  # 訪問履歴の登録
  def new
    @area = Area.find(params[:id])
    @visit = VisitHistory.new
  end

  def create
    @visit = VisitHistory.new(visit_params)
    @area =  current_user.areas
    @areas = Area.find(params[:area_id])

    if @visit.save
      flash[:success] = "登録しました"
      redirect_to visit_path(@areas)
    else
      flash[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private

  def visit_params
    params.require(:visit_history).permit(:customer, :appointment, :visit, :contract, :note).merge(user_id: current_user.id, area_id: params[:area_id])
  end
end
