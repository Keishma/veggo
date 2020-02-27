Rails.application.routes.draw do
  resources :prices

  resources :products
  # get 'products/index'
  # get 'products/new'
  # get 'products/show'
  # get 'products', to: 'products#index'
  # get 'products/:id', to: 'products#show', as: :product
  # get 'products/new'

  resources :shops
  # get 'shops', to: 'shops#index'
  # get 'shops/new', to: 'shops#new'

  get 'pages/home'
  devise_for :users
  root to: 'products#index'

end
