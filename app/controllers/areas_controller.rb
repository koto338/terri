class AreasController < ApplicationController

 # テリ登録ボタン
  def new
    @area = Area.all
    @area = Area.new
  end

  def create
    Area.create(area_params)
    @area = Area.all
  end  
  # def create 
  #   @area = Area.new(area_params)
  #   if @area.save
  #     flash[:success] = "登録しました"
  #     redirect_to root_path 
  #   else
  #     flash.now[:danger] = "登録に失敗しました"
  #     render new_area_path
  #   end
  # end

  # 移動リンク
  def update
    @area = Area.all
    @area.update(status: 0)
    redirect_to root_path
  end


  private
    def area_params
      params.require(:area).permit(:town)
    end
    # def area_params
    #   params.require(:area).permit(:ward, :town, :city_block, :status)
    # end
end