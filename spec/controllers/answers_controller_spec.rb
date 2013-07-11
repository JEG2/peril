require 'spec_helper'

describe AnswersController do
  before do
    @answer   = FactoryGirl.create(:answer)
    @category = @answer.category
    @game     = @category.game
    @reward   = @game.rewards.create!(score: 200)
  end

  it "fetches the referenced game" do
    get :show, game_slug:     @game.slug,
               category_slug: @category.slug,
               reward_score:  @reward.score
    expect(response).to be_success
    expect(assigns(:game)).to eq(@game)
  end

  it "looks up the referenced answer" do
    get :show, game_slug:     @game.slug,
               category_slug: @category.slug,
               reward_score:  @reward.score
    expect(response).to be_success
    expect(assigns(:answer)).to eq(@answer)
  end

  it "will give a not found error for a missing game" do
    expect do
      get :show, game_slug:     "missing",
                 category_slug: @category.slug,
                 reward_score:  @reward.score
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "will give a not found error for a badly referenced answer" do
    expect do
      get :show, game_slug:     @game.slug,
                 category_slug: "missing",
                 reward_score:  @reward.score
    end.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "records the view of the answer" do
    expect(ViewedEvent.find_by_answer_id(@answer.id)).to be_nil
    get :show, game_slug:     @game.slug,
               category_slug: @category.slug,
               reward_score:  @reward.score
    expect(response).to be_success
    expect(ViewedEvent.find_by_answer_id(@answer.id)).not_to be_nil
  end
end
