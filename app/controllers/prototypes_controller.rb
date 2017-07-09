class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:capture_images).order("created_at DESC ")
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = current_user.prototypes.new
    @prototype.capture_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Post is success"
    else
      redirect_to new_prototype_path, alert: @prototype.errors.full_messages
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,capture_images_attributes: [:content, :role])
  end
end
