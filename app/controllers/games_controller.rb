class GamesController < ApplicationController
  def index
    @games = Game.order("created_at DESC")
  end

  def show
    @game = Game.includes(categories: :answers)  # loses order
                .find_by_slug!(params[:slug])
    # restore ordering
    @game.categories.sort_by!(&:position)
    @game.categories.each do |category|
      category.answers.sort_by!(&:position)
    end
  end
end
