class Prototypes::PopularController < PrototypesController

  def index
    @prototype = Prototype.includes([:user, :tags]).order(likes_count: :DESC).limit(5)
  end
end
