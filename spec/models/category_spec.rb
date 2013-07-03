require 'spec_helper'

require_relative "named_slug_examples"

describe Category do
  it_behaves_like "named slug"

  it "belongs to a game" do
    game     = FactoryGirl.create(:game)
    category = Category.new(game_id: game.id)
    expect(category.game).to eq(game)
  end

  it "supports managing the order" do
    category = FactoryGirl.create(:category)
    expect(category.respond_to?(:move_lower)).to be_true
    expect(category.respond_to?(:move_higher)).to be_true
  end

  it "has many answers" do
    category = FactoryGirl.create(:category)
    answer   = FactoryGirl.create(:answer, category_id: category.id)
    expect(category.answers).to eq([answer])
  end

  it "preserves the order of categories" do
    category = FactoryGirl.create(:category)
    answers  = Array.new(3) { FactoryGirl.create(:answer, category: category) }
    expect(category.answers).to eq(answers)
  end
end
