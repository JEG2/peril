require 'spec_helper'

describe EventsController do
  before do
    @answer   = FactoryGirl.create(:answer)
    @category = @answer.category
    @game     = @category.game
  end

  it "fetches the referenced game" do
    delete :destroy, game_slug: @game.slug
    expect(assigns(:game)).to eq(@game)
  end

  it "undoes the most recent event" do
    answers = [@answer] + Array.new(2) {
      FactoryGirl.create(:answer, category: @category)
    }
    events  = Array.new(3) { |i|
      FactoryGirl.create(:viewed_event, game: @game, answer: answers[i])
    }
    delete :destroy, game_slug: @game.slug
    expect(response).to be_redirect
    events.first(2).each do |event|
      expect(ViewedEvent.find_by_id(event.id)).to eq(event)
    end
    expect(ViewedEvent.find_by_id(events.last.id)).to be_nil
  end

  it "just redirects if there's no event to undo" do
    expect(@game.events).to be_empty
    delete :destroy, game_slug: @game.slug
    expect(response).to be_redirect
  end
end
