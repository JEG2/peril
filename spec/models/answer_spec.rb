require 'spec_helper'

describe Answer do
  it "belongs to a category" do
    category = FactoryGirl.create(:category)
    answer   = Answer.new(category_id: category.id)
    expect(answer.category).to eq(category)
  end

  it "supports managing the order" do
    answer = FactoryGirl.create(:answer)
    expect(answer.respond_to?(:move_lower)).to be_true
    expect(answer.respond_to?(:move_higher)).to be_true
  end

  it "requires a body" do
    answer = Answer.new
    expect(answer).to have_an_invalid_field(:body)

    answer.body = "42."
    expect(answer).to have_a_valid_field(:body)
  end

  it "requires a question" do
    answer = Answer.new
    expect(answer).to have_an_invalid_field(:question)

    answer.question = "What is the meaning of life, " +
                      "the universe, and everything?"
    expect(answer).to have_a_valid_field(:question)
  end

  it "knows if the viewed flag has been set" do
    answer = Answer.new
    expect(answer).not_to be_viewed

    answer.viewed_at = Time.now
    expect(answer).to be_viewed
  end
end
