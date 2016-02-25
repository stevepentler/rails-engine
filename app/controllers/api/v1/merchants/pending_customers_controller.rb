class Api::V1::Merchants::PendingCustomersController < Api::ApiController
  respond_to :json

  def index
    customers = Merchant.find(params[:id])
                        .invoices
                        .joins(:transactions)
                        .where("transactions.result = ?", "failed")
                        .group(:customer_id)
                        .count

    pending_customers = customers.map do |customer_id, pending|
      Customer.find(customer_id)
    end

    respond_with(pending_customers)
  end
end