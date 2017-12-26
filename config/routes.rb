Rails.application.routes.draw do
  devise_for :employees

  resources :complaints do
    resources :supports
    resources :fishbone_analyses
    resources :five_m_analyses
  end
  resources :fishbone_analyses, only: [] do
    resources :amef_analyses
  end
  resources :products
  resources :employees do
    collection do
      get 'edit_password'
      patch 'update_password'
    end
  end

  root to: 'complaints#index'
end
