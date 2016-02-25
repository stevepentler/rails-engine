class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def show
    if params[:date]             
      respond_with({revenue: total_revenue_by_date})
    else            
      respond_with({revenue: total_revenue})
    end
  end

  private

    def total_revenue_by_date 
      Merchant.find(params[:id]).invoices
                                .joins(:transactions)
                                .where("invoices.created_at = ?", params[:date])
                                .where("transactions.result = ?", "success")
                                .joins(:invoice_items)
                                .sum("unit_price * quantity")
    end

    def total_revenue
      Merchant.find(params[:id]).invoices
                                .joins(:transactions)
                                .where("transactions.result = ?", "success")
                                .joins(:invoice_items)
                                .sum("unit_price * quantity")
    end
end