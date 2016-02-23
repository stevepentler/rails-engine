class Api::V1::CustomerRandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Customer.count)
    respond_with Customer.offset(random).first
  end
end