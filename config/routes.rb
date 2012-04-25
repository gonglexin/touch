Touch::Application.routes.draw do
  resources :products
  match 'about' => 'pages#about', :as => 'about'
  match 'contact' => 'pages#contact', :as => 'contact'
  root :to => 'pages#index'

  namespace :admin do
    match 'login' => 'sessions#new', :as => 'login'
    match 'logout' => 'sessions#destroy', :as => 'logout'
    match 'setting' => 'admins#edit', :as => 'setting'
    root :to => 'products#index'
    resources :products
    resources :categories
    resources :sessions
    resources :admins
  end
end
