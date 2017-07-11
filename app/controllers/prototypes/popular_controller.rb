class Prototypes::PopularController < PrototypesController

  def index
    @prototype = Prototype.eager_load(:user).order("likes_count DESC").limit(5)
  end
end
