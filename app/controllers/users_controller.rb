class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id:params[:id])
    @shops=Shop.where(user_id:@user.id)
  end

  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user=User.find_by(id:params[:id]).destroy
    if @user.destroy
      flash[:success] = "User deleted"
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
  
end
