Rails.application.routes.draw do
  
  devise_for :users, ActiveAdmin::Devise.config

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :companies
  resources :companies

  ActiveAdmin.routes(self)

  root to: 'main#index'
end
