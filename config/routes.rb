Rails.application.routes.draw do
  devise_for :users
  # get 'orders/:id/reset_status', to: 'orders#reset_status', :as => "reset_status"
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :product_orders 
  resources :orders do
    member do
      get :reset_status
    end
  end
  resources :user

  # do
  #   resources :reviews, only: [ :new, :create ]
  # end

end
