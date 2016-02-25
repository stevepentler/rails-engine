class Api::V1::Merchants::FinderController < Api::ApiController
  respond_to :json

  def show
    merchants = Merchant.where(merchant_params)
    respond_with merchants.find_by(build_query)
  end

  def index
    merchants = Merchant.where(merchant_params)
    respond_with merchants.where(build_query)
  end

  private 

  def build_query
    query = []
    query << "name ILIKE '#{merchant_name_params[:name]}'" if merchant_name_params[:name]
  end

  def merchant_params
    params.permit(:created_at, :id, :updated_at)
  end

  def merchant_name_params
    params.permit(:name)
  end
end