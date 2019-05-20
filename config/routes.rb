Rails.application.routes.draw do
  root 'offenses#index'
  resources :offenses,  only: [:index, :new, :create]
  devise_for :admin
  resources :offense_imports, only: [:new, :create]
end
