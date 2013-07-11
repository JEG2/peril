require 'spec_helper'

describe Event do
  it "belongs to a game" do
    game  = FactoryGirl.create(:game)
    event = Event.new(game_id: game.id)
    expect(event.game).to eq(game)
  end

  it "belongs to an answer" do
    answer = FactoryGirl.create(:answer)
    event  = Event.new(answer_id: answer.id)
    expect(event.answer).to eq(answer)
  end

  it "requires a game" do
    event = Event.new
    expect(event).to have_an_invalid_field(:game_id)

    event.game = FactoryGirl.create(:game)
    expect(event).to have_a_valid_field(:game_id)
  end

  it "requires an answer" do
    event = Event.new
    expect(event).to have_an_invalid_field(:answer_id)

    event.answer = FactoryGirl.create(:answer)
    expect(event).to have_a_valid_field(:answer_id)
  end

  it "requires the answer to be unique" do
    # allowed the first time
    event = FactoryGirl.create(:viewed_event)

    dup = event.class.new(answer: event.answer)
    expect(dup).to have_an_invalid_field(:answer_id)
  end

  it "can fetch most recent events first" do
    events = Array.new(3) { FactoryGirl.create(:viewed_event) }
    expect(Event.most_recent).to eq(events.reverse)
  end
end
