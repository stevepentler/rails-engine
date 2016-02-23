class Api::V1::MerchantRandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Merchant.count)
    respond_with Merchant.offset(random).first
  end
end