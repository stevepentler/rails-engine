class Api::V1::TransactionsInvoiceController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id]).invoice
  end
end