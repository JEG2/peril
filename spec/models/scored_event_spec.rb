require 'spec_helper'

describe ScoredEvent do
  before do
    @answer = FactoryGirl.create(:answer)
    @game   = @answer.category.game
    @reward = FactoryGirl.create(:reward, game: @game)
    @player = FactoryGirl.create(:player, game: @game)
  end

  it "adds the proper score to the proper player before saving" do
    event = FactoryGirl.build( :scored_event, game:   @game,
                                              answer: @answer,
                                              player: @player )
    expect(ScoredEvent.last).to be_nil
    event.save!
    saved = ScoredEvent.last
    expect(saved.game).to   eq(@game)
    expect(saved.answer).to eq(@answer)
    expect(saved.player).to eq(@player)
  end

  it "reduces the score when destroyed" do
    event = FactoryGirl.create( :scored_event, game:   @game,
                                               answer: @answer,
                                               player: @player )
    expect(@player.score).to eq(@reward.score)
    event.destroy
    expect(@player.score).to be_zero
  end

  it "quietly does nothing when the answer is removed before the event" do
    event = FactoryGirl.create( :scored_event, game:   @game,
                                               answer: @answer,
                                               player: @player )
    @answer.destroy
    expect do
      event.reload.destroy
    end.not_to raise_error(Exception)
  end
end
