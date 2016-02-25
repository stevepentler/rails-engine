class Api::V1::Merchants::PendingCustomersController < Api::ApiController
  respond_to :json

  def index
    respond_with(pending_customers)
  end

  private
  
  def pending_customers
    customers = Merchant.find(params[:id])
                    .invoices
                    .joins(:transactions)
                    .where("transactions.result = ?", "failed")
                    .group(:customer_id)
                    .count

    pending_customers = customers.map do |customer_id, pending|
      Customer.find(customer_id)
    end
  end
end