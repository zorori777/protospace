class PrototypesController < ApplicationController

  def new
    @prototype = current_user.prototypes.new
    @prototype.capture_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Post is success"
    else
      flash.now[:alert] = "Post is false"
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,capture_images_attributes: [:content, :role])
  end
end
