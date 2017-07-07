Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: %i[show edit update]
  resources :prototypes, only: %i[index new create]
end
