require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "#index" do 
    customer = create(:customer)
    
    get :index, format: :json, id: customer.id

    invoices = JSON.parse(response.body)

    assert_response :success
  end
end