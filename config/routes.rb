Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  resources :items, only: :order do
    post 'purchases', on: :member
  end
  resources :cards, only: [:new, :create]
  resources :users, only: [:new, :create, :show]
end
