Rails.application.routes.draw do
  resources :games, only: [:create, :show, :index]
  resources :betslips, only: [:create]

  get 'dashboard/:country', to: 'dashboard#index'

  root 'dashboard#index'
end
