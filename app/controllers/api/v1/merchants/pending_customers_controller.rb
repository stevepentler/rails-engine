class Api::V1::Merchants::PendingCustomersController < Api::ApiController
  respond_to :json

  def index
    customer = Customer.new
    respond_with(customer.pending_customers(params))
  end

  private

  # def pending_customers(params)
  #   customers = Merchant.find(params[:id])
  #                   .invoices
  #                   .joins(:transactions)
  #                   .where("transactions.result = ?", "failed")
  #                   .group(:customer_id)
  #                   .count

  #   pending_customers = customers.map do |customer_id, pending|
  #     Customer.find(customer_id)
  #   end
  # end
end