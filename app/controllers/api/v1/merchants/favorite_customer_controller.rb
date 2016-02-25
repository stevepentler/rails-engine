class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(Merchant.favorite_customer(params))
  end
end