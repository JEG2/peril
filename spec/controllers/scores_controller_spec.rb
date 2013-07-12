require 'spec_helper'

describe ScoresController do
  before do
    @answer = FactoryGirl.create(:answer, viewed_at: Time.now)
    @game   = @answer.category.game
    @reward = FactoryGirl.create(:reward, game: @game)
    @player = FactoryGirl.create(:player, game: @game)
  end

  it "fetches the referenced game" do
    get :create, game_slug: @game.slug, player_id: @player.id
    expect(assigns(:game)).to eq(@game)
  end

  it "fetches the most recently viewed answer" do
    FactoryGirl.create(:answer, category: @answer.category)
    get :create, game_slug: @game.slug, player_id: @player.id
    expect(assigns(:answer)).to eq(@answer)
  end

  it "fetches the referenced player" do
    get :create, game_slug: @game.slug, player_id: @player.id
    expect(assigns(:player)).to eq(@player)
  end

  it "builds the scored event" do
    lookup = [:find_by_game_id_and_answer_id, @game.id, @answer.id]
    expect(ScoredEvent.send(*lookup)).to be_nil
    get :create, game_slug: @game.slug, player_id: @player.id
    expect(ScoredEvent.send(*lookup)).not_to be_nil
  end

  it "just redirects if it cannot score an answer" do
    @answer.update_attributes(viewed_at: nil)
    get :create, game_slug: @game.slug, player_id: @player.id
    expect(response).to be_redirect
    expect(ScoredEvent.last).to be_nil
  end
end
