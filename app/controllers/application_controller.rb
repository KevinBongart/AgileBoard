class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_board

  def find_board
    @board = Board.first
    @project = Project.first
  end
end
