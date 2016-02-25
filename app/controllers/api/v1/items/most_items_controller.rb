class Api::V1::Items::MostItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with top_results
  end
  
  private

  def top_results
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