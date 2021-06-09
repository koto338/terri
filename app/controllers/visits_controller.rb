class VisitsController < ApplicationController
  # 訪問履歴の登録
  def new
    @visit = VisitHistory.new
  end

  def create 
    @visit = VisitHistory.new(visit_params)
    if @visit.save
      flash[:success] = "登録しました"
      redirect_to root_path 
    else
      flash[:danger] = "登録に失敗しました"
      render new_visit_path
    end
  end


  private

  def visit_params
    params.require(:visit_history).permit(:customer, :appointment, :visit, :contract, :note).merge(user_id: current_user.id)
  end

end
