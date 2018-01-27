Rails.application.routes.draw do
  devise_for :employees

  resources :complaints do
    resources :supports
    resources :fishbone_analyses, except: %i[edit update]
    resources :eight_ms_analyses
  end
  resources :fishbone_analyses, only: [] do
    resources :amef_analyses, except: %i[index edit update]
  end
  resources :amef_components, only: [] do
    resources :action_plans
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
