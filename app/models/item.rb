class Item <ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_results(params)
    quantity = params["quantity"].to_i
    result = Invoice.all
             .joins(:transactions)
             .where("transactions.result = ?", 'success')
             .joins(:invoice_items)
             .order("sum(quantity) desc")
             .group(:item_id)
             .sum(:quantity).to_a

    top_results = result.map do |item_id, total_sold|
      Item.find(item_id)
    end.take(quantity)
  end
end