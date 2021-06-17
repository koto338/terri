class VisitsController < ApplicationController
  # 訪問履歴の登録
  def show
    @area = Area.find(params[:id])
    @user = current_user
    # @visit = VisitHistory.all
    # @visit = current_user.visit_histories
  end
  
  def new
    @visit = VisitHistory.new
    @area = Area.find(params[:id])
  end

  def create
    @visit = VisitHistory.new(visit_params)
    @area = Area.find(params[:id])
    
    if @visit.save
      flash[:success] = "登録しました"
      redirect_to visit_path
    else
      flash[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private

  def visit_params
    params.permit(:customer, :appointment, :visit, :contract, :note).merge(user_id: current_user.id)
  end
end
