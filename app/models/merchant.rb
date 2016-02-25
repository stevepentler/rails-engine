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
end