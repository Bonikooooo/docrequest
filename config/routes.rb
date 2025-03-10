  
  Rails.application.routes.draw do
  get 'requests/processing', to: 'requests#processing'
  resources :requests do
    post 'update_processing_status', on: :member
    get 'processing', on: :member
end
  devise_for :users
  devise_for :admins
 
  root 'pages#home'
  get 'pages/users'
  get 'pages/admin'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
 
  # Defines the root path route ("/")
  # root "posts#index"
 end