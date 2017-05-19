Rails.application.routes.draw do

  devise_for :users
  
  resources :registered_apps
  
  authenticated :user do
    root 'registered_apps#index', as: :authenticated_root
  end
  
  get 'welcome/index'
  get 'welcome/about'
  
  root 'welcome#index'
  
  namespace :api, default: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
