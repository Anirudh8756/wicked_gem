Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :steps, only: [:show, :update], controller: 'steps'
end
