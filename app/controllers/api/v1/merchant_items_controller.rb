class Api::V1::MerchantItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).items
  end
end