class Api::V1::Merchants::PendingCustomersController < Api::ApiController
  respond_to :json

  def index
    customer = Customer.new
    respond_with(customer.pending_customers(params))
  end

  private

end