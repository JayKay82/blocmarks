Rails.application.routes.draw do
  # Users
  devise_for :users
  resources :users, only: [:update]

  # Topics and bookmarks
  resources :topics, except: [:update]
  resources :bookmarks, except: [:index, :show]

  # Incoming emails
  post :incoming, to: 'incoming#create'

  # Root
  authenticated :user do
    root to: 'topics#index', as: 'authenticated_root'
  end
  root to: 'welcome#index'
end
