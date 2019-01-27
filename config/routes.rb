Rails.application.routes.draw do

  devise_for :users, path_prefix: 'my'
  resources :users do
    member do
      get :orderindex, as: "orders"
    end
  end

  # get 'users/:id/orders', to 'orders#'

  # , :controllers => { registrations: 'registrations' }
  # get 'orders/:id/reset_status', to: 'orders#reset_status', :as => "reset_status"
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      get :change_active
    end
  end
  resources :product_orders, except: [:index, :show]
  resources :product_orders, only: [:index, :show], param: :year_number, as: "date"
  get "/product_orders/:year_number/:week_number", to: "product_orders#week", as: "week"
  resources :orders do
    member do
      get :reset_status
    end
  end
  resources :customer_orders, only: [:index, :show], param: :year_number, as: "customer_orders_year"
  get "/customer_orders/:year_number/:week_number", to: "customer_orders#week", as: "customer_orders_week"

end
