Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/customers/random', to: 'customer_random#show'
      get '/customers/find', to: 'customer_finder#show'
      get '/customers/find_all', to: 'customer_finder#index'
      resources :customers, only: [:index, :show]
      get '/merchants/:id/invoices', to: 'merchant_invoices#index'
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/random', to: 'merchant_random#show'
      get '/merchants/find', to: 'merchant_finder#show'
      get '/merchants/find_all', to: 'merchant_finder#index'
      resources :merchants, only: [:index, :show]
      get '/items/random', to: 'items_random#show'
      get '/items/find', to: 'items_finder#show'
      get '/items/find_all', to: 'items_finder#index'
      resources :items, only: [:index, :show]
      get '/invoices/:id/transactions', to: 'invoice_transactions#index'
      get '/invoices/random', to: 'invoices_random#show'
      get '/invoices/find', to: 'invoices_finder#show'
      get '/invoices/find_all', to: 'invoices_finder#index'
      resources :invoices, only: [:index, :show]
      get '/invoice_items/random', to: 'invoice_items_random#show'
      get '/invoice_items/find', to: 'invoice_items_finder#show'
      get '/invoice_items/find_all', to: 'invoice_items_finder#index'
      resources :invoice_items, only: [:index, :show]
      get '/transactions/random', to: 'transactions_random#show'
      get '/transactions/find', to: 'transactions_finder#show'
      get '/transactions/find_all', to: 'transactions_finder#index'
      resources :transactions, only: [:index, :show]
    end
  end
end
