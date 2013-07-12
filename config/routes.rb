Peril::Application.routes.draw do
  root to: "games#index"

  get ":slug"                                   => "games#show",
      as: :game
  get ":game_slug/intro"                        => "categories#index",
      as: :intro
  get ":game_slug/:category_slug/:reward_score" => "answers#show",
      as: :answer
  get ":game_slug/undo"                         => "events#destroy",
      as: :undo
  get ":game_slug/:player_id"                   => "scores#create",
      as: :score
end
