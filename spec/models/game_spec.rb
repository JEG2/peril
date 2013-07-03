require 'spec_helper'

describe Game do
  it "requires a name" do
    game = Game.new
    expect(game).to have_an_invalid_field(:name)

    game.name = "Test"
    expect(game).to have_a_valid_field(:name)
  end

  it "requires the name to be unique" do
    game = FactoryGirl.create(:game)  # allowed the first time

    dup = Game.new(name: game.name)
    expect(dup).to have_an_invalid_field(:name)
  end

  it "generates a slug from the name" do
    game = Game.new(name: "test")
    expect(game.slug).to eq("test")
  end

  it "downcases generated slugs" do
    game = Game.new(name: "Test")
    expect(game.slug).to eq("test")
  end

  it "replaces all non-alphanumerics with dashes in generated slugs" do
    game = Game.new(name: "key => value")
    expect(game.slug).to eq("key-value")
  end

  it "removes leading and trailing non-alphanumerics in generated slugs" do
    game = Game.new(name: "  test!")
    expect(game.slug).to eq("test")
  end
end
