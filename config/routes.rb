Rails.application.routes.draw do
  root "top#index"
  
  get "login" => "sessions#new", as: :login
  resource :session, only: [:create, :destroy]
  resource :account, except: [:new, :create, :destroy]
  resource :password, only: [:show, :edit, :update]

  resources :members
  resources :animes, shallow: true do
    resource :favorites, only: [:create, :destroy]
    get :favorites, on: :collection
    collection { get "search" }
  end
  resources :posts
  resources :schedules
  resources :contacts, only: [:new, :create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

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
    resources :schedules
  end
end
