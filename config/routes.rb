Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :offenses, only: [:index] do 
        collection do 
          post 'offenses_pdf'
        end
      end
    end
  end
  root 'offenses#index'
  resources :offenses, only: [:index, :new, :create, :show]
  devise_for :admin
  resources :offense_imports, only: [:new, :create]
end
