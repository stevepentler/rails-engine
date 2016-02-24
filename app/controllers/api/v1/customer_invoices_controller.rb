class Api::V1::CustomerInvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Customer.find(params[:id]).invoices
  end
end