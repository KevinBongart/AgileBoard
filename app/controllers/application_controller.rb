class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_board

  def find_board
    if user_signed_in?
      @board = current_user.board
      @project = current_user.board.projects.first unless current_user.board.projects.blank?
    end 
  end
end
