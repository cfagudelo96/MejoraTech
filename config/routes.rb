Rails.application.routes.draw do
  devise_for :employees

  resources :complaints
  resources :products
  resources :employees do
    collection do
      get 'edit_password'
      patch 'update_password'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'complaints#index'
end
