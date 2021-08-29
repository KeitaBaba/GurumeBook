class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @shops=Shop.all
  end

  def new
    @shop=Shop.new
    @review=Review.new
  end

  def show
    @shop=Shop.find_by(id:params[:id])
    @reviews = @shop.reviews
    @review = Review.new
  end

  def create
    @shop=Shop.new(shop_params)
    @shop.user_id=current_user.id
    if @shop.save
      flash[:notice] ="投稿しました"
      redirect_to shops_path
    else
      render action: :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user != current_user
        redirect_to shops_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: "お店を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path, notice: "削除しました。"
  end
  


  def shop_params
    params.require(:shop).permit(:name, :body, :address, :latitude, :longitude, :evaluation,{images: [] })
  end
end
