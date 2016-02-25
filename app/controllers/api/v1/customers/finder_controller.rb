class Api::V1::Customers::FinderController < Api::ApiController
  respond_to :json

  def show
    customers = Customer.where(customer_params)
    respond_with customers.find_by(build_query)
  end

  def index
    customers = Customer.where(customer_params)
    respond_with customers.where(build_query)
  end


  private

    def build_query
      query = []
      query << "first_name ILIKE '#{customer_name_params[:first_name]}'" if customer_name_params[:first_name]
      query << "last_name ILIKE '#{customer_name_params[:last_name]}'" if customer_name_params[:last_name]
      query.join(" AND ")
    end

    def customer_params
      params.permit(:created_at, :id, :updated_at)
    end

    def customer_name_params
      params.permit(:first_name, :last_name)
    end
end