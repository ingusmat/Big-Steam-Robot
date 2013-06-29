BigSteamRobot::Application.routes.draw do
  get "army_units/destroy"

  root :to => 'pages#home'
  resources :armies
  match '/armies/add_unit' => 'armies#add_unit'
  match '/army_units/destroy' => 'army_units#destroy'
  resources :games
  resources :units
  match '/units/list_available_models' => 'units#list_available_models'
  resources :factions
  devise_for :users
  resources :users
end
