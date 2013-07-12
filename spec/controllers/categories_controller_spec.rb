require 'spec_helper'

describe CategoriesController do
  before do
    @category = FactoryGirl.create(:category)
    @game     = @category.game
  end

  it "fetches the referenced game" do
    get :index, game_slug: @game.slug
    expect(response).to be_success
    expect(assigns(:game)).to eq(@game)
  end

  it "fetches the categories used in the game" do
    get :index, game_slug: @game.slug
    expect(response).to be_success
    expect(assigns(:categories)).to eq([@category])
  end
end
