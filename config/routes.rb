Rails.application.routes.draw do
  root 'offenses#index'
  resources :offenses
  devise_for :admin
  resources :offense_imports, only: [:new, :create]
end
