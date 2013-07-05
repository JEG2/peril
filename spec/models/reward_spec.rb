require 'spec_helper'

describe Reward do
  it "belongs to a game" do
    game   = FactoryGirl.create(:game)
    reward = Reward.new(game_id: game.id)
    expect(reward.game).to eq(game)
  end

  it "supports managing the order" do
    reward = FactoryGirl.create(:reward)
    expect(reward.respond_to?(:move_lower)).to be_true
    expect(reward.respond_to?(:move_higher)).to be_true
  end

  it "requires a score" do
    reward = Reward.new
    expect(reward).to have_an_invalid_field(:score)

    reward.score = 200
    expect(reward).to have_a_valid_field(:score)
  end

  it "requires that score be an integer" do
    reward = Reward.new(score: "NAN")
    expect(reward).to have_an_invalid_field(:score)

    reward.score = 0.007
    expect(reward).to have_an_invalid_field(:score)
  end

  it "requires that score be positive" do
    reward = Reward.new(score: -1)
    expect(reward).to have_an_invalid_field(:score)
  end
end
