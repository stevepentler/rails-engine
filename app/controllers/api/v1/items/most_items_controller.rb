class Api::V1::Items::MostItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.top_results(params)
  end
end