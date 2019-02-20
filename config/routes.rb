Rails.application.routes.draw do
  resources :prices
  resources :products
  # get 'products/index'
  # get 'products/new'
  # get 'products/show'
  # get 'products', to: 'products#index'
  # get 'products/:id', to: 'products#show', as: :product
  # get 'products/new'
  get 'pages/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
