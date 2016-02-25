class Api::V1::Customers::FavoriteMerchantController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(favorite_merchant)
  end

  private 

  def favorite_merchant
    customer = Customer.find(params[:id])
    merchant_id = customer.invoices.joins(:transactions)
                     .where("result = 'success'") 
                     .group(:merchant_id)
                     .count
                     .max_by{|k,v| v}.first
  end
end