class Api::V1::Customers::FavoriteMerchantController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(Customer.favorite_merchant(params))
  end
  
end