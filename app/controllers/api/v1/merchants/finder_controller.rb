class Api::V1::Merchants::FinderController < Api::ApiController
  respond_to :json

  def show
    merchants = Merchant.where(merchant_params)
    unless merchant_name_params.empty?
      respond_with merchants.find_by(build_query)
    else
      respond_with merchants.first
    end
  end

  def index
    merchants = Merchant.where(merchant_params)
    unless merchant_name_params.empty?
      respond_with merchants.where(build_query)
    else
      respond_with merchants
    end
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

#   def find
#     if params[:id]
#       respond_with Merchant.find(params[:id])
#     elsif params[:name]
#       respond_with Merchant.find_by('LOWER(name) = ?', params[:name].downcase)
#     elsif params[:created_at]
#       respond_with Merchant.find_by(created_at: params[:created_at])
#     elsif params[:updated_at]
#       respond_with Merchant.find_by(updated_at: params[:updated_at])
#     end
#   end

#   def find_all
#     if params[:id]
#       respond_with Merchant.where(id: params[:id])
#     elsif params[:name]
#       respond_with Merchant.where('LOWER(name) = ?', params[:name].downcase)
#     elsif params[:created_at]
#       respond_with Merchant.where(created_at: params[:created_at])
#     elsif params[:updated_at]
#       respond_with Merchant.where(updated_at: params[:updated_at])
#     end
#   end
# end