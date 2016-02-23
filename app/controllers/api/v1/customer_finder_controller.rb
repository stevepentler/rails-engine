class Api::V1::CustomerFinderController < Api::ApiController
  respond_to :json

  def show
    parse_params(params)
    
  end

  private 

  def parse_params(params)
    if params[:id]
      respond_with Customer.find(params[:id])
    elsif params[:first_name]
      respond_with Customer.find_by(first_name: params[:first_name])
    elsif params[:last_name]
      respond_with Customer.find_by(last_name: params[:last_name])
    elsif params[:created_at]
      respond_with Customer.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Customer.find_by(updated_at: params[:updated_at])
    end
  end
end