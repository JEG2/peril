class AnswersController < ApplicationController
  ###############
  ### Filters ###
  ###############

  before_filter :find_game
  after_filter  :record_view

  def record_view
    ViewedEvent.create(game: @game, answer: @answer)
  end
  private :record_view

  ###############
  ### Actions ###
  ###############

  def show
    @answer = @game.answer_for(params[:category_slug], params[:reward_score]) or
      fail ActiveRecord::RecordNotFound
  end
end
