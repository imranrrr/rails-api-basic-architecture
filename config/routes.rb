Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
    },
    controllers: {
      sessions: 'sessions',
      passwords:  'passwords',
    }

    namespace :api, defaults: { format: 'json' } do
      namespace :v1 do
        resources :products, only: [index] do
          member do
            get :sales
            get :tracking_inventories
          end
        end
        resources :track_inventories
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
