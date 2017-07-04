class UsersController < ApplicationController

  before_action :authenticate_user!, only: %i[edit update]

  before_action :setting_user,       only: %i[edit update show]

  def index
  end

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to user_path, notice: "Updat is success!!"
    else
      flash.now[:alert] = "Update is false!"
      render :edit
    end
  end

private

  def setting_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :profile,
                                 :image,
                                 :member,
                                 :work)
  end
end
