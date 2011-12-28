Touch::Application.routes.draw do
  resources :products
  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :products
    resources :categories
  end

  root :to => 'pages#index'
end
