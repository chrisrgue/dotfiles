Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # For list of routes currently supported by the APP
  # either
  #   point browser to: localhost:3000/rails/info/routes
  # or run
  #   rails routes  # in the rails app' project root
  # root "players#index"
  root "users#index"

  resources :players
  resources :users, only: [:index, :create]
  resources :sessions, only: [:create]

  get "log_out" => "sessions#destroy"
  # get "players" => "players#index"
  # get "players/new" => "players#new"
  # post "players" => "players#create"
  # get "players/:id" => "players#show", as: "player"
  # get "players/:id/edit" => "players#edit", as: "player_edit"
  # patch "players/:id" => "players#update"
  # delete "players/:id" => "players#destroy"
end
