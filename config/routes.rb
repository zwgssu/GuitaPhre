Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'top#index'

  resources :users, only: [:index, :show] do
    member do
      get :favorite_users
      get :favorite_phrases
      get :themes
    end
    collection do
      get :mypage
    end
  end
  resources :phrases
  resources :themes
  resource :favorite_users, only: [:create, :destroy]
  resource :favorite_phrases, only: [:create, :destroy]

  get '/search' => 'search#search'
end
