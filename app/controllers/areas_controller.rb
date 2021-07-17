class AreasController < ApplicationController

 # テリ登録ボタン
  def new
    @area = Area.new
  end

  def create 
    @area = Area.new(area_params)
    if @area.save
      flash[:success] = "登録しました"
      redirect_to root_path 
    else
      flash.now[:danger] = "登録に失敗しました"
      render new_area_path
    end
  end

  # 移動リンク
  def update
    area = Area.find(params[:id])
    area.update(status: 0)
    redirect_to root_path
  end

  # 検索
  def search
    @keyword = params[:keyword]

    if @keyword.present?
      @areas = []
      # 分割したキーワードごとに検索
      @keyword.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @areas += Area.where('ward LIKE? OR town LIKE?', "%#{keyword}%", "%#{keyword}%")
      end
    end
  end

  

  private

    def area_params
      params.require(:area).permit(:ward, :town, :city_block, :status).merge(user_id: current_user.id)
    end
end