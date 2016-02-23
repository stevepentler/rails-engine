class Api::V1::ItemsInvoiceItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end