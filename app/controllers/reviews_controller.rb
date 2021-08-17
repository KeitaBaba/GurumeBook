class ReviewsController < ApplicationController
  def create
    # ログインユーザーのみがコメントできる
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.new(review_params)
    
    if @review.save
      redirect_to shop_path(@shop)
    
    else
      render 'shops/show'
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    review=current_user.reviews.find(params[:id])
    review.destroy
    redirect_to shop_path(@shop)
  end
  
  private

  def review_params
    params.require(:review).permit(:content).merge(shop_id: params[:shop_id]) #①
  end
end


