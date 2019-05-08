Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit, :update]

  resources :posts, only: [:edit, :update]
  resources :product_orders, except: [:index, :show]
  resources :product_orders, only: [:index, :show], param: :year_number, as: "date"
  resources :customer_orders, only: [:index, :show], param: :year_number, as: "customer_orders_year"
  resources :products, only: :index

  get "/product_orders/:year_number/:week_number", to: "product_orders#week", as: "week"
  get "/customer_orders/:year_number/:week_number", to: "customer_orders#week", as: "customer_orders_week"

  resources :orders do
    member do
      get :reset_status
    end
  end

  namespace :admin do
    resources :selling_ranges
    resources :products, except: :show do
      member { get :toggle_active }
    end
    resources :users do
      resources :transactions, only: [:create, :destroy]
    end
    resources :orders, only: [:show, :edit]
    resources :statistics, only: [:index, :show], param: :year

    root to: 'selling_ranges#index'
  end

  root to: "pages#home"
end
