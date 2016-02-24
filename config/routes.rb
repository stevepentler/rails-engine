Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do

            # resources :customers, only: [:show, :index] do 
      #   collection do 
      #     get '/:id/invoices', to: 'invoices#index'
      #     get '/:id/transactions', to: 'transactions#index'
      #     get '/random', to: 'random#show'
      #     get '/find', to: 'finder#show'
      #     get '/find_all', to: 'finder#index'
      #   end
      # end
      namespace :customers do 
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :customers, only: [:index, :show]


      get '/merchants/:id/invoices', to: 'merchant_invoices#index'
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/random', to: 'merchant_random#show'
      get '/merchants/find', to: 'merchant_finder#show'
      get '/merchants/find_all', to: 'merchant_finder#index'
      resources :merchants, only: [:index, :show]
      get '/items/:id/invoice_items', to: 'items_invoice_items#index'
      get '/items/:id/merchant', to: 'items_merchant#show'
      get '/items/random', to: 'items_random#show'
      get '/items/find', to: 'items_finder#show'
      get '/items/find_all', to: 'items_finder#index'
      resources :items, only: [:index, :show]
     
      namespace :invoices do 
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
        resources :invoices, only: [:index, :show]

      namespace :invoice_items do 
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :invoice_items, only: [:index, :show]


      
      get '/transactions/:id/invoice', to: 'transactions_invoice#show'
      get '/transactions/random', to: 'transactions_random#show'
      get '/transactions/find', to: 'transactions_finder#show'
      get '/transactions/find_all', to: 'transactions_finder#index'
      resources :transactions, only: [:index, :show]
    end
  end
end
