Touch::Application.routes.draw do
  root :to => 'pages#index'

  get 'about'   => 'pages#about',   :as => 'about'
  get 'contact' => 'pages#contact', :as => 'contact'
  resources :products, :only => [:index, :show]

  namespace :admin do
    root :to => 'products#index'

    get 'login'   => 'sessions#new',     :as => 'login'
    get 'logout'  => 'sessions#destroy', :as => 'logout'
    get 'about'   => 'contents#about',   :as => 'about'
    get 'contact' => 'contents#contact', :as => 'contact'
    get 'setting' => 'admins#edit',      :as => 'setting'

    resources :products
    resources :categories
    resources :sessions, :only => :create
    resources :admins,   :only => :update
    resources :contents, :only => :update
  end
end
