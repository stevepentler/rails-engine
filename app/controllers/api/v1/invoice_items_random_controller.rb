class Api::V1::InvoiceItemsRandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(InvoiceItem.count)
    respond_with InvoiceItem.offset(random).first
  end
end