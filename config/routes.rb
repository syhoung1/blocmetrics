Rails.application.routes.draw do

  devise_for :users
  
  resources :registered_apps
  
  authenticated :user do
    root 'registered_apps#index', as: :authenticated_root
  end
  
  get 'welcome/index'
  get 'welcome/about'
  
  root 'welcome#index'
end
