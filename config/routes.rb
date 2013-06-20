BigSteamRobot::Application.routes.draw do
  authenticated :user do
    root :to => "pages#home"
  end
  root :to => 'pages#home'
  devise_for :users
  resources :users
end
