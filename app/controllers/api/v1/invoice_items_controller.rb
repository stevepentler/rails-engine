class Api::V1::InvoiceItemsController < Api::ApplicationController
  respond_to :json
  def index
    respond_with InvoiceItem.all
  end 

  def show
    respond_with InvoiceItem.find(params[:id])
  end
end