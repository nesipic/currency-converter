Rails.application.routes.draw do
  devise_for :users
  root to: 'conversions#new'
  resources :conversions, only: [:index, :new, :create, :destroy]
end
