class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def show
    if params[:date]             
      respond_with({revenue: Merchant.total_revenue_by_date(params)})
    else            
      respond_with({revenue: Merchant.total_revenue(params)})
    end
  end
end