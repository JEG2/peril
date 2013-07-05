class GameLoader
  class DSL < BasicObject
    def initialize(game, reload)
      @game          = game
      @reload        = reload
      @last_category = nil
    end

    def game(name)
      @game.name = name
      if @reload && (already_loaded = @game.class.find_by_name(name))
        already_loaded.destroy
      end
    end

    def category(name)
      @last_category = @game.categories.build(name: name)
    end

    def answer(body, question)
      @last_category.answers.build(body: body, question: question)
    end

    def rewards(*scores)
      scores.each do |score|
        @game.rewards.build(score: score)
      end
    end

    def players(*names)
      names.each do |name|
        @game.players.build(name: name)
      end
    end
  end

  def initialize(reload: false)
    @game   = Game.new
    @reload = reload
  end

  attr_reader :game, :reload
  private     :game, :reload

  def configure(*args, &block)
    DSL.new(game, reload).instance_eval(*args, &block)
  end

  def configure_from_file(path)
    configure(File.read(path), path)
  end

  def load
    game.save
    game
  end
end
