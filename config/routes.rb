NumberSenseiRails4::Application.routes.draw do

  resources :lessons

  resources :courses
  get '/dojo' => 'courses#index'

  resources :tricks

  resources :challenges

  resources :questions

  resources :expressions

  resources :challenge_categories

  get '/downloads', to: 'official_challenges#index'
  resources :official_challenges

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
