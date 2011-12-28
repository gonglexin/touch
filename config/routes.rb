Touch::Application.routes.draw do
  resources :products
  root :to => 'pages#index'

  namespace :admin do
    root :to => 'products#index'
    resources :products
    resources :categories
  end

end
