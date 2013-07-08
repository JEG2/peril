require 'spec_helper'

describe GamesController do
  it "lists games newest to oldest" do
    games = Array.new(3) { FactoryGirl.create(:game) }

    get :index

    expect(response).to be_success
    expect(assigns(:games)).to eq(games.reverse)
  end

  it "loads games by slug" do
    game = FactoryGirl.create(:game)

    get :show, slug: game.slug

    expect(response).to be_success
    expect(assigns(:game)).to eq(game)
  end

  it "ensures category and answer order are preserved" do
    game     = Game.new(name: "Game")
    category = game.categories.build(name: "C1")
    category.answers.build(body: "A1", question: "Q1")
    category.answers.build(body: "A2", question: "Q2")
    category = game.categories.build(name: "C2")
    category.answers.build(body: "A3", question: "Q3")
    category.answers.build(body: "A4", question: "Q4")
    game.rewards.build(score: 200)
    game.rewards.build(score: 400)
    game.save!

    get :show, slug: game.slug

    expect(response).to be_success
    nesting_order = assigns(:game).categories.flat_map { |c|
      [c.name, *c.answers.map(&:body)]
    }
    expect(nesting_order).to eq(%w[C1 A1 A2 C2 A3 A4])
  end
end
