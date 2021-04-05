Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers, only: [:show, :create, :update]
  resources :carts, only: [:show, :create, :update] do
    member do
      put 'update_line_item'
      post 'create_line_item'
    end
  end
  resources :orders, only: [:index, :show, :create, :update]
  resources :addresses, only: [:index, :show, :create, :update]
end
