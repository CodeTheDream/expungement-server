Rails.application.routes.draw do
  resources :offenses
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
