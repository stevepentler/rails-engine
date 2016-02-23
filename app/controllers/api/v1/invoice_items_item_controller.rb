class Api::V1::InvoiceItemsItemController < Api::ApiController
  respond_to :json
  def show
    respond_with InvoiceItem.find(params[:id]).item
  end
end