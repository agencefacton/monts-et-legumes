Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit, :update]
  resources :product_orders, except: [:index, :show]
  resources :product_orders, only: [:index, :show], param: :year_number, as: "date"
  resources :products, only: :index
  get :wait, to: "pages#wait"

  resources :orders do
    member do
      get :reset_status
    end
  end

  namespace :admin do
    resources :posts, only: [:edit, :update]
    resources :selling_ranges
    resources :products, except: :show do
      member { get :toggle_active }
    end
    resources :users do
      resources :transactions, only: [:create, :destroy]
    end
    resources :orders, only: [:show, :edit, :update, :new, :create, :destroy] do
      resources :product_orders, only: [:create]
    end
    resources :product_orders, except: [:index, :show, :create]
    resources :statistics, only: [:index, :show], param: :year

    root to: 'selling_ranges#index'
  end

  root to: "pages#home"
end
