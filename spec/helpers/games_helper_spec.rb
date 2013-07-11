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
  it "renders blank rewards for viewed answers" do
    answer = Answer.new(viewed_at: Time.now)
    expect(helper.render_reward(nil, nil, answer)).to eq("&nbsp;")
  end

  it "it renders a linked amount for an actual reward" do
    answer = FactoryGirl.create(:answer)
    answer.category.game.rewards.create!(score: 200)
    link = helper.render_reward(answer.category.game, answer.category, answer)
    expect(link).to match(/<a\b[^>]+>200\b/)
  end
end
