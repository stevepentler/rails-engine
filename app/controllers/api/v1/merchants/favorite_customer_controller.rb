class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController
  respond_to :json

  def show
    customer = Customer.new
    respond_with Customer.find(customer.favorite_customer(params))
  end
end