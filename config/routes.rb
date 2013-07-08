Peril::Application.routes.draw do
  root to: "games#index"

  get ":slug" => "games#show", as: :game
end
