class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.favorite_customer(params)
    merchant = Merchant.find(params[:id])
    customer_id = merchant.invoices.joins(:transactions)
                     .where("result = 'success'") 
                     .group(:customer_id)
                     .count
                     .max_by{|k,v| v}.first
  end
  
  def self.total_revenue_by_date(params)
    Merchant.find(params[:id]).invoices
                              .joins(:transactions)
                              .where("invoices.created_at = ?", params[:date])
                              .where("transactions.result = ?", "success")
                              .joins(:invoice_items)
                              .sum("unit_price * quantity")
  end

  def self.total_revenue(params)
    Merchant.find(params[:id]).invoices
                              .joins(:transactions)
                              .where("transactions.result = ?", "success")
                              .joins(:invoice_items)
                              .sum("unit_price * quantity")
  end

end