class CommentsController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create
    current_user.comments.create(comment_params)
    prototype = Prototype.find(params[:prototype_id])
    @comments =  prototype.comments.includes(:user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id])
  end
end
