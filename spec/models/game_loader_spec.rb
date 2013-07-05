require 'spec_helper'

require "tempfile"

describe GameLoader do
  def load_game(path = nil, &configuration)
    loader = GameLoader.new
    loader.configure_from_file(path) if path
    loader.configure(&configuration) if configuration
    loader.load
  end

  it "manages a game object" do
    game = load_game
    expect(game).to be_an_instance_of(Game)
  end

  it "tries to save on load" do
    game = load_game
    expect(game.errors).not_to be_empty
  end

  it "can configure the game object before loading" do
    game = load_game do
      game "Test Game"
    end
    expect(game.name).to eq("Test Game")
  end

  it "can add categories to a game during configuration" do
    game = load_game do
      category "Test Category"
    end
    expect(game.categories.size).to       eq(1)
    expect(game.categories.first.name).to eq("Test Category")
  end

  it "can add answers to the most recently configured category" do
    game = load_game do
      category "One"
      answer   "A1", "Q1"

      category "Two"
      answer   "A2", "Q2"
      answer   "A3", "Q3"
    end
    expect(game.categories.size).to                      eq(2)
    expect(game.categories.first.name).to                eq("One")
    expect(game.categories.first.answers.size).to        eq(1)
    expect(game.categories.first.answers.first.body).to  eq("A1")
    expect(game.categories.last.name).to                 eq("Two")
    expect(game.categories.last.answers.size).to         eq(2)
    expect(game.categories.last.answers.map(&:body)).to  eq(%w[A2 A3])
  end

  it "can build a reward list during configuration" do
    game = load_game do
      rewards 200, 400
    end
    expect(game.rewards.size).to         eq(2)
    expect(game.rewards.map(&:score)).to eq([200, 400])
  end

  it "can be configured from a file" do
    game_file = Tempfile.new("test_game")
    game_file.puts "game 'Test File Load Game'"
    game_file.close

    game = load_game(game_file.path)
    expect(game.name).to eq("Test File Load Game")
  end
end
