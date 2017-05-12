Rails.application.routes.draw do

  devise_for :users
  
  resources :users do
    resources :registered_apps
  end
  
  get 'welcome/index'
  get 'welcome/about'
  
  root 'welcome#index'
end
