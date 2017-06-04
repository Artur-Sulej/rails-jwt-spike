Rails.application.routes.draw do
  defaults format: :json do
    devise_for :users, controllers:
      { sessions: 'users/sessions', registrations: 'users/registrations' }
  end
  resources :things, only: [:index]
end
