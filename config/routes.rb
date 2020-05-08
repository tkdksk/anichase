Rails.application.routes.draw do
  root "top#index"
  
  get "login" => "sessions#new", as: :login
  resource :session, only: [:create, :destroy]
  resource :account, except: [:new, :create, :destroy]
  resource :password, only: [:show, :edit, :update]

  resources :members
  resources :animes do
    collection { get "search" }
  end
  resources :posts

  namespace :admin do
    root "top#index"
    resources :members, only: [:index, :show, :destroy] do
      collection { get "search" }
    end
    resources :animes do
      collection { get "search" }
    end
    resources :posts do
      collection { get "search" }
    end
  end
end
