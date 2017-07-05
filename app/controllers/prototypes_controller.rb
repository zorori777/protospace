class PrototypesController < ApplicationController

  def new
    @prototype = Prototype.new
  end
end
