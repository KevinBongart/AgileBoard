class WelcomeController < ApplicationController
  def index
    @stages = Stage.includes(:stories).all
  end
end
