Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    resources :reviews, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
