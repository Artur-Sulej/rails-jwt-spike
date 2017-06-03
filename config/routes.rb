Rails.application.routes.draw do
  devise_for :users
  resources :things, only: [:index]
end
