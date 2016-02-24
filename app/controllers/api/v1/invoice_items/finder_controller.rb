class Api::V1::InvoiceItems::FinderController < Api::ApiController
  respond_to :json

  def show
    invoice_items = InvoiceItem.where(invoice_item_params)
    respond_with invoice_items.first
  end

  def index
    invoice_items = InvoiceItem.where(invoice_item_params)
    respond_with invoice_items
  end

  private

  def invoice_item_params
    params.permit(:item_id, :invoice_id, :quantity, :unit_price, :created_at, :id, :updated_at)
  end
end