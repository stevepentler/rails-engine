class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.pending_customers(params)
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

  def self.favorite_merchant(params)
    customer = Customer.find(params[:id])
    merchant_id = customer.invoices.joins(:transactions)
                     .where("result = 'success'") 
                     .group(:merchant_id)
                     .count
                     .max_by{|k,v| v}.first
  end

end