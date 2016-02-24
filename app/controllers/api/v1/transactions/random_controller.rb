class Api::V1::Transactions::RandomController < Api::ApiController
  respond_to :json

  def show
    random = rand(Transaction.count)
    respond_with Transaction.offset(random).first
  end
end