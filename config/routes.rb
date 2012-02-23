Touch::Application.routes.draw do
  resources :products
  root :to => 'pages#index'

  namespace :admin do
    match 'log_in' => 'sessions#new', :as => 'log_in'
    match 'log_out' => 'sessions#destroy', :as => 'log_out'
    root :to => 'products#index'
    resources :products
    resources :categories
    resources :admins
    resources :sessions
  end

end
