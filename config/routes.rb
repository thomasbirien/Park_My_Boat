Rails.application.routes.draw do
  get 'profile/show'

  devise_for :users
  root to: 'pages#home'

  resources :ports, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :show]
  end

  resources :bookings, only: [:index]
  resources :boats, only: [:index, :new, :create, :edit, :update]

  resource :profile, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
