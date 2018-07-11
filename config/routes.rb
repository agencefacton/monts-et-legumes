Rails.application.routes.draw do
  get 'product_orders/show'
  get 'product_orders/index'
  get 'product_orders/new'
  get 'product_orders/create'
  get 'product_orders/edit'
  get 'product_orders/update'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/destroy'
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/updatenew'
  mount ForestLiana::Engine => '/forest'
  get 'home', to: 'pages#home', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
end
