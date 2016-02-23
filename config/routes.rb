Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/find', to: 'customer_finder#show', defaults: {format: :json}
      get '/customers/find_all', to: 'customer_finder#index', defaults: {format: :json}
      resources :customers, only: [:index, :show], defaults: {format: :json}
      resources :merchants, only: [:index, :show], defaults: {format: :json}
      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
      resources :transactions, only: [:index, :show], defaults: {format: :json}
    end
  end
end
