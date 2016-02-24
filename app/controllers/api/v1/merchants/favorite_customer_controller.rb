class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(favorite_customer)
  end

  private 

  def favorite_customer
    merchant = Merchant.find(params[:id])
    cusotmer_id= merchant.invoices.joins(:transactions)
                     .where("result = 'success'") 
                     .group(:customer_id)
                     .count
                     .max_by{|k,v| v}.first
  end
end