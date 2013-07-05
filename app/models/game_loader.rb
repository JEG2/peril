class GameLoader
  class DSL < BasicObject
    def initialize(game)
      @game          = game
      @last_category = nil
    end

    def game(name)
      @game.name = name
    end

    def category(name)
      @last_category = @game.categories.build(name: name)
    end

    def answer(body, question)
      @last_category.answers.build(body: body, question: question)
    end
  end

  def initialize
    @game = Game.new
  end

  attr_reader :game
  private     :game

  def configure(*args, &block)
    DSL.new(game).instance_eval(*args, &block)
  end

  def configure_from_file(path)
    configure(File.read(path), path)
  end

  def load
    game.save
    game
  end
end
