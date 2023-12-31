Rails.application.routes.draw do
  resources :kinds
  
  resources :auths, only: [:create]

  resources :contacts do
    resource :kind, only: [:show]

    resource :phones, only: [:show]
    resource :phone, only: [:update, :create, :destroy]

    resource :address, only: [:show, :update, :create, :destroy]

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
