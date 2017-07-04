Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: %i[show edit update]
end
