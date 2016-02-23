class Api::V1::InvoiceMerchantController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id]).merchant
  end
end