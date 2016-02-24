class Api::V1::Customers::RandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Customer.count)
    respond_with Customer.offset(random).first
  end
end