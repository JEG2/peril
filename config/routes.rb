Peril::Application.routes.draw do
  root to: "games#index"

  get ":slug"                                   => "games#show",   as: :game
  get ":game_slug/:category_slug/:reward_score" => "answers#show", as: :answer
end
