class Prototypes::PopularController < PrototypesController

  def index
    @prototype = Prototype.includes([:user, :tags]).order(likes_count: :DESC).page(params[:page]).per(5)
  end
end
