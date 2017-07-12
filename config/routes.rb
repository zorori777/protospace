Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update]
  resources :prototypes do
    resources :comments, only: :create
    resources :likes, only: %i[create destroy]
  end
  resources :tags, only: %i[index show]
# routing fot sort popular
  scope module: 'prototypes' do
    root to: "popular#index"
  end
end
