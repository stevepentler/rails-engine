class Api::V1::InvoiceCustomerController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).customer
  end
end