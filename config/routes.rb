Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'top#index'

  resources :users, only: [:index, :show]
  resources :phrases
  resources :themes

  get '/search' => 'search#search'
end
