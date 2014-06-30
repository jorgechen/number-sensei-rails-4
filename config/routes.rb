NumberSenseiRails4::Application.routes.draw do

  post 'background_jobs/check_progress'

  get 'games/index'
  get 'games/cryptogram'
  post 'games/new_cryptogram', to: 'games#new_cryptogram'
  get 'games', to: 'games#index'

  # User authentication:
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :lessons

  resources :courses

  resources :tricks

  resources :challenges do
    member do
      post 'attempt'
    end
  end

  resources :questions do
    member do
      post 'attempt'
    end
  end

  resources :badges

  resources :expressions

  resources :challenge_categories

  get '/learn', to: 'tricks#index'
  get '/dojo', to: 'courses#index'
  get '/downloads', to: 'official_challenges#index'
  get '/play_god', to: 'home#play_god'
  resources :official_challenges

  root :to => 'home#index'

  # clock demo
  get '/clock', to: 'home#clock'
  get '/about', to: 'home#about'

  resources :users, :only => [:index, :show, :edit, :update ]
  #get '/auth/:provider/callback' => 'sessions#create'
  #get '/signin' => 'sessions#new', :as => :signin
  #get '/signout' => 'sessions#destroy', :as => :signout
  #get '/auth/failure' => 'sessions#failure'

  # Background jobs, aka BJs
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  put '/seed' => 'home#seed'
end
