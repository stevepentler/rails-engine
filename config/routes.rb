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

      namespace :merchants do 
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :merchants, only: [:index, :show]
      
      namespace :items do 
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
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
