Rails.application.routes.draw do
  devise_for :users, path_prefix: 'my'

  resources :users do
    resources :transactions, except: :show, as: "transactions"
    member do
      get :orderindex, as: "orders"
    end
  end

  resources :selling_ranges, except: :show
  resources :posts, only: [:edit, :update]
  resources :product_orders, except: [:index, :show]
  resources :product_orders, only: [:index, :show], param: :year_number, as: "date"
  resources :customer_orders, only: [:index, :show], param: :year_number, as: "customer_orders_year"

  get "/product_orders/:year_number/:week_number", to: "product_orders#week", as: "week"
  get "/customer_orders/:year_number/:week_number", to: "customer_orders#week", as: "customer_orders_week"

  resources :products do
    member do
      get :change_active
    end
  end

  resources :orders do
    member do
      get :reset_status
    end
  end

  root to: "pages#home"
end
