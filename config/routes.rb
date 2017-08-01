Rails.application.routes.draw do
  devise_for :employees

  resources :complaints
  resources :products
  resources :employees

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'complaints#index'
end
