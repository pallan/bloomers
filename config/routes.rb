Bloomers::Application.routes.draw do

  get "reports/index"
  get "reports/product_count"

  resources :customers
  resources :categories
  resources :plants
  resources :groups do
    resources :orders do
      get :product_counts, :on => :collection
      resources :line_items, only: [:create, :update, :destroy]
    end
  end

  root :to => 'orders#index'

end
