NumberSenseiRails4::Application.routes.draw do

  # User authentication:
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :lessons

  resources :courses

  resources :tricks

  resources :challenges

  resources :questions

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
