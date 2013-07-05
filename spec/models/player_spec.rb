require 'spec_helper'

describe Player do
  it "belongs to a game" do
    game   = FactoryGirl.create(:game)
    player = Player.new(game_id: game.id)
    expect(player.game).to eq(game)
  end

  it "supports managing the order" do
    player = FactoryGirl.create(:player)
    expect(player.respond_to?(:move_lower)).to be_true
    expect(player.respond_to?(:move_higher)).to be_true
  end

  it "requires a name" do
    player = Player.new
    expect(player).to have_an_invalid_field(:name)

    player.name = "Test"
    expect(player).to have_a_valid_field(:name)
  end

  it "defaults the score to zero" do
    player = Player.new
    expect(player.score).to eq(0)
  end

  it "requires that score be an integer" do
    player = Player.new(score: "NAN")
    expect(player).to have_an_invalid_field(:score)

    player.score = 0.007
    expect(player).to have_an_invalid_field(:score)
  end

  it "requires that score be zero or positive" do
    player = Player.new(score: -1)
    expect(player).to have_an_invalid_field(:score)
  end
end
