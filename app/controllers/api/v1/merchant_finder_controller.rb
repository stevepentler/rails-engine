class Api::V1::MerchantFinderController < Api::ApiController
  respond_to :json

  def index
    find_all
  end

  def show
    find
  end

  private 

  def find
    if params[:id]
      respond_with Merchant.find(params[:id])
    elsif params[:name]
      respond_with Merchant.find_by('LOWER(name) = ?', params[:name].downcase)
    elsif params[:created_at]
      respond_with Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.find_by(updated_at: params[:updated_at])
    end
  end

  def find_all
    if params[:id]
      respond_with Merchant.find(id: params[:id])
    elsif params[:name]
      respond_with Merchant.where('LOWER(name) = ?', params[:name].downcase)
    elsif params[:created_at]
      respond_with Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.where(updated_at: params[:updated_at])
    end
  end
end