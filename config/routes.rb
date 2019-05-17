Rails.application.routes.draw do
  root 'offense_imports#new'
  resources :offense_imports, only: [:new, :create]
end
