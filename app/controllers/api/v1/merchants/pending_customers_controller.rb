class Api::V1::Merchants::PendingCustomersController < Api::ApiController
  respond_to :json

  def index
    respond_with(Customer.pending_customers(params))
  end
  
end