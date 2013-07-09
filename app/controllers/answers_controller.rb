class AnswersController < ApplicationController
  def show
    @game   = Game.find_by_slug!(params[:game_slug])
    @answer = @game.answer_for(params[:category_slug], params[:reward_score]) or
      fail ActiveRecord::RecordNotFound
  end
end
