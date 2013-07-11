class EventsController < ApplicationController
  ###############
  ### Filters ###
  ###############

  before_filter :find_game

  ###############
  ### Actions ###
  ###############

  def destroy
    if (@event = @game.events.most_recent.first)
      @event.destroy
    end
    redirect_to game_path(@game)
  end
end
