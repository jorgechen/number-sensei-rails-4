NumberSenseiRails4::Application.routes.draw do

  # Sign up/in/out paths:
  devise_for :users

  resources :lessons

  resources :courses

  resources :tricks

  resources :challenges

  resources :questions

  resources :expressions

  resources :challenge_categories

  get '/learn', to: 'tricks#index'
  get '/dojo', to: 'courses#index'
  get '/challenge', to: 'challenges#index'
  get '/download', to: 'official_challenges#index'
  resources :official_challenges

  root :to => 'home#index'

  resources :users, :only => [:index, :show, :edit, :update ]
  #get '/auth/:provider/callback' => 'sessions#create'
  #get '/signin' => 'sessions#new', :as => :signin
  #get '/signout' => 'sessions#destroy', :as => :signout
  #get '/auth/failure' => 'sessions#failure'
end
