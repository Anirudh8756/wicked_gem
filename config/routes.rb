Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resource :personal_information, only: [:show, :update]
  resource :project, only: [:show, :update]
  resource :intrest, only: [:show, :update]
  resource :tool, only: [:show, :update]

  # Define the route for the steps controller
  resources :steps, only: [:show, :update], controller: 'user/steps'
end
