class LikesController < ApplicationController
    def create
        @like=Like.new(user_id:current_user.id, shop_id:params[:shop_id])
        @like.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like=Like.find_by(user_id:current_user.id, shop_id:params[:shop_id])
        @like.destroy
        redirect_back(fallback_location: root_path)
    end

end
