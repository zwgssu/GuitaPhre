Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'top#index'
  get "/atfirst" => "atfirst#atfrist"

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
end
