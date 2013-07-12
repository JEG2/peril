require 'spec_helper'

require_relative "named_slug_examples"

describe Game do
  it_behaves_like "named slug"

  it "has many players" do
    game   = FactoryGirl.create(:game)
    player = FactoryGirl.create(:player, game_id: game.id)
    expect(game.players).to eq([player])
  end

  it "preserves the order of players" do
    game    = FactoryGirl.create(:game)
    players = Array.new(3) { FactoryGirl.create(:player, game: game) }
    expect(game.players).to eq(players)
  end

  it "removes players with the game" do
    player = FactoryGirl.create(:player)
    player.game.destroy
    expect(Player.find_by_id(player.id)).to be_nil
  end

  it "has many rewards" do
    game   = FactoryGirl.create(:game)
    reward = FactoryGirl.create(:reward, game_id: game.id)
    expect(game.rewards).to eq([reward])
  end

  it "preserves the order of rewards" do
    game    = FactoryGirl.create(:game)
    rewards = Array.new(3) { FactoryGirl.create(:reward, game: game) }
    expect(game.rewards).to eq(rewards)
  end

  it "removes rewards with the game" do
    reward = FactoryGirl.create(:reward)
    reward.game.destroy
    expect(Reward.find_by_id(reward.id)).to be_nil
  end

  it "has many categories" do
    game     = FactoryGirl.create(:game)
    category = FactoryGirl.create(:category, game_id: game.id)
    expect(game.categories(true)).to eq([category])
  end

  it "preserves the order of categories" do
    game       = FactoryGirl.create(:game)
    categories = Array.new(3) { FactoryGirl.create(:category, game: game) }
    expect(game.categories(true)).to eq(categories)
  end

  it "removes categories with the game" do
    category = FactoryGirl.create(:category)
    category.game.categories(true)  # refresh the list so destroy() will see it
    category.game.destroy
    expect(Category.find_by_id(category.id)).to be_nil
  end

  it "has many events" do
    game  = FactoryGirl.create(:game)
    event = FactoryGirl.create(:viewed_event, game_id: game.id)
    expect(game.events(true)).to eq([event])
  end

  it "removes events with the game" do
    event = FactoryGirl.create(:viewed_event)
    event.game.events(true)  # refresh the list so destroy() will see it
    event.game.destroy
    expect(ViewedEvent.find_by_id(event.id)).to be_nil
  end

  it "requires a reward for each answer" do
    game     = Game.new(name: "Game")
    category = game.categories.build(name: "Category")
    category.answers.build(body: "A1", question: "Q1")
    category.answers.build(body: "A2", question: "Q2")
    game.rewards.build(score: 200)
    expect(game).to have_an_invalid_field(:categories)

    game.rewards.build(score: 400)
    expect(game).to have_a_valid_field(:categories)
  end

  it "can find the reward for a given answer" do
    game     = Game.new(name: "Game")
    category = game.categories.build(name: "Category")
    answer_1 = category.answers.build(body: "A1", question: "Q1")
    answer_2 = category.answers.build(body: "A2", question: "Q2")
    reward_1 = game.rewards.build(score: 200)
    reward_2 = game.rewards.build(score: 400)
    game.save!

    expect(game.reward_for(answer_1)).to eq(reward_1)
    expect(game.reward_for(answer_2)).to eq(reward_2)
  end

  it "returns nil if a reward cannot be found" do
    game = FactoryGirl.create(:game)
    expect(game.reward_for(Answer.new)).to be_nil
  end

  it "can locate answers for a given category and reward" do
    game       = Game.new(name: "Game")
    category_1 = game.categories.build(name: "C1")
    answer_1   = category_1.answers.build(body: "A1", question: "Q1")
    answer_2   = category_1.answers.build(body: "A2", question: "Q2")
    category_2 = game.categories.build(name: "C2")
    answer_3   = category_2.answers.build(body: "A3", question: "Q3")
    answer_4   = category_2.answers.build(body: "A4", question: "Q4")
    reward_1   = game.rewards.build(score: 200)
    reward_2   = game.rewards.build(score: 400)
    game.save!

    expect(game.answer_for(category_1.slug, reward_1.score)).to eq(answer_1)
    expect(game.answer_for(category_2.slug, reward_2.score)).to eq(answer_4)
  end

  it "returns a nil answer if it cannot be found for any reason" do
    game = FactoryGirl.create(:game)
    expect(game.answer_for("missing", 200)).to be_nil

    category = FactoryGirl.create(:category, game: game)
    expect(game.answer_for(category.slug, 200)).to be_nil
  end

  it "can find the last viewed answer" do
    last_viewed = FactoryGirl.create(:answer, viewed_at: Time.now)
    game        = last_viewed.category.game
    other       = FactoryGirl.create(:category, game: game)
    FactoryGirl.create(:answer, category: other, viewed_at: nil)
    expect(game.reload.last_viewed_answer).to eq(last_viewed)
  end

  it "returns nil if there aren't any viewed answers" do
    game = FactoryGirl.create(:game)
    expect(game.last_viewed_answer).to be_nil
  end
end
