Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :shops do
    resources :likes, only:[:create, :destroy]
    resources :reviews, only:[:create,:destroy]
  end

  end
