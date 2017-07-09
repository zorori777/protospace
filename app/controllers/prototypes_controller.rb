class PrototypesController < ApplicationController

  before_action :set_prototype, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @prototypes = Prototype.includes(:capture_images).order("created_at DESC ")
  end

  def new
    @prototype = current_user.prototypes.new
    @prototype.capture_images.build
  end

  def create
    @prototype = current_user.prototypes.new(create_params)
    if @prototype.save
      redirect_to root_path, notice: "Post is success"
    else
      redirect_to new_prototype_path, alert: @prototype.errors.full_messages
    end
  end

  def show
  end

  def edit
  end

  def update
    if @prototype.update(create_params)
      redirect_to root_path, notice: "Update is success"
    else
      redirect_to prototype_path(@prototype), alert: @prototype.errors.full_messages
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: "Delete is success"
  end

  private

  def create_params
    params.require(:prototype).permit(
      :title, :catch_copy, :concept,
      capture_images_attributes: [:id, :content, :role])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
