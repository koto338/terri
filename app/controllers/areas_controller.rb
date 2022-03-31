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
        # 入力された文字列を空白で分解 .split(/[[:blank:]]/)  => ['渋谷区', '', '桜丘町']
        # 連続した空白も除去           .split(/[[:blank:]]+/) => ['渋谷区', '桜丘町']
        @areas += Area.where('ward LIKE? OR town LIKE?', "%#{keyword}%", "%#{keyword}%")
          # 部分一致検索 "%#{keyword}%"　
          # % はゼロ文字以上の文字列がある状態
          # 前方一致検索は"#{keyword}%" 、後方一致検索は"%#{keyword}" と書ける
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @areas = Area.where(user_id: @user.id)
  end

  private

    def area_params
      params.require(:area).permit(:ward, :town, :city_block, :status).merge(user_id: current_user.id)
    end
end
