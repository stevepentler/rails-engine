class Api::V1::Items::RandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Item.count)
    respond_with Item.offset(random).first
  end
end