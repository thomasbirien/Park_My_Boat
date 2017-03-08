Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'pages#home'

  resources :ports, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :show]
  end

  resources :bookings, only: [:destroy]
  resources :boats, only: [:new, :create, :edit, :update, :destroy]

  resource :profile, only: [:show]

  resource :user, only: [:edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

