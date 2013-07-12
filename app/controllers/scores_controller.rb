class ScoresController < ApplicationController
  ###############
  ### Filters ###
  ###############

  before_filter :find_game

  ###############
  ### Actions ###
  ###############

  def create
    @player = @game.players.find_by_id!(params[:player_id])
    if (@answer = @game.last_viewed_answer)
      ScoredEvent.create(game: @game, answer: @answer, player: @player)
    end
    redirect_to(game_path(@game))
  end
end
