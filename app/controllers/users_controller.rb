class UsersController < ApplicationController

  before_action :setting_user, only: %i[edit show]

  def index
  end

  def edit
  end

  def show
  end

private
  def setting_user
    @user = User.find(params[:id])
  end
end
