class Api::V1::InvoiceRandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Invoice.count)
    respond_with Invoice.offset(random).first
  end
end