class Api::V1::Invoices::RandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Invoice.count)
    respond_with Invoice.offset(random).first
  end
end