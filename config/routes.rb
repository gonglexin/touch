Touch::Application.routes.draw do
  resources :products
  root :to => 'pages#index'

  namespace :admin do
    match 'log_in' => 'sessions#new', :as => 'log_in'
    match 'log_out' => 'sessions#destroy', :as => 'log_out'
    match 'setting' => 'admins#edit', :as => 'setting'
    root :to => 'products#index'
    resources :products
    resources :categories
    resources :sessions
    resources :admins
  end

end