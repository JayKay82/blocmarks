Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  resources :topics, only: [:create]
  resources :bookmarks, only: [:create]
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
end
