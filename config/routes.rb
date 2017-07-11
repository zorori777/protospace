Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: %i[show edit update]
  resources :prototypes do
    resources :comments, only: :create
    resources :likes, only: %i[create destroy]
  end
end
