class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #######
  private
  #######

  def find_game
    @game = Game.find_by_slug!(params[:game_slug])
  end
end
