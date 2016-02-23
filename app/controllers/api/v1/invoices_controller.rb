class Api::V1::InvoiceController < Api::ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
    binding.pry
  end

  def show
    respond_with Invoice.find(params[:id])
  end
end