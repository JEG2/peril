require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe GamesHelper do
  it "renders a score link followed by the icon" do
    game  = Game.new(name: "Scored")
    score = helper.render_score(200, game_path(game))
    expect(score).to match(%r{<a\b[^>]+>200</a>\s+<img\b})
  end

  it "renders blank rewards for viewed answers" do
    answer = Answer.new(viewed_at: Time.now)
    expect(helper.render_reward(nil, nil, answer)).to eq("&nbsp;")
  end

  it "it renders a linked amount for an actual reward" do
    answer = FactoryGirl.create(:answer)
    reward = answer.category.game.rewards.create!(score: 200)
    link   = helper.render_reward(answer.category.game, answer.category, answer)
    path   = answer_path(answer.category.game, answer.category, reward)
    score  = helper.render_score(reward.score, path)
    expect(link).to eq(score)
  end
end
