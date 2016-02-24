class Api::V1::Invoices::InvoiceItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).invoice_items
  end
end