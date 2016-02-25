class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def show
    if params[:date]
    total_revenue = Merchant.find(params[:id]).invoices.joins(:transactions)
                                                    .where("invoices.created_at = ?", params[:date])
                                                    .where("transactions.result = ?", "success")
                                                    .joins(:invoice_items)
                                                    .sum("unit_price * quantity")
                    
    respond_with({revenue: total_revenue})
    else
      total_revenue = Merchant.find(params[:id]).invoices.joins(:transactions)
                                                    .where("transactions.result = ?", "success")
                                                    .joins(:invoice_items)
                                                    .sum("unit_price * quantity")
                    
    respond_with({revenue: total_revenue})
  end

  end
end

  # def show
  #   revenue = 0 
  #   successful_invoices = Merchant.find(params[:id]).invoices.joins(:transactions).where("result = 'success'")
  #   successful_invoices.map do |invoice|
  #     invoice.invoice_items.map do |invoice_item|
  #       revenue += invoice_item.quantity * invoice_item.unit_price.to_f
  #     end
  #   end
  #   respond_with revenue
  # end