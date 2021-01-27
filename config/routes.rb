Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :stores
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
