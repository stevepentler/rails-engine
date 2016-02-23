Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/customers/random', to: 'customer_random#show'
      get '/customers/find', to: 'customer_finder#show'
      get '/customers/find_all', to: 'customer_finder#index'
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
