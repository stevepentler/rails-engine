class Api::V1::Items::MostRevenueController < Api::ApiController
  respond_to :json

  def index
    quantity = params["quantity"]

   result = Item.joins(:invoice_items)
                .joins(:invoices)
        # .joins(:transactions)
        #    .where("transactions.result = ?", "success")
        #    .joins(:invoice_items)
        #    .sum("unit_price * quantity")
        #    .joins(:item)
                    
    


  end





        # total_revenue = Merchant.find(params[:id]).invoices.joins(:transactions)
        #                                             .where("transactions.result = ?", "success")
        #                                             .joins(:invoice_items)
        #                                             .sum("unit_price * quantity")


end
