Rails.application.routes.draw do
  root 'offenses#index'
  namespace :api do 
    namespace :v1 do 
      resources :offense do 
        member do
          post 'import_user_information'
        end
        collection do
          get 'import_user_information'
        end
      end
    end
  end
  resources :offenses
  devise_for :admin
  resources :offense_imports, only: [:new, :create]
end
