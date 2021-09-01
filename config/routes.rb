Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root 'top#index'
  get "/atfirst" => "atfirst#atfirst"

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
  resources :phrases do
    resources :comments, only: [:create, :destroy]
  end
  resources :themes do
    resources :theme_comments, only: [:create, :destroy]
  end
  resource :favorite_users, only: [:create, :destroy]
  resource :favorite_phrases, only: [:create, :destroy]

  get '/search' => 'search#search'

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  namespace :admin do
    root "top#index"
    resources :users, only: [:index, :destroy]
    resources :phrases, only: [:index, :show, :destroy]
    resources :themes, only: [:index, :show, :destroy]
  end
end
