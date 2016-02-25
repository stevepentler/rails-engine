require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "#show" do 
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id,
                             status: "shipped")
    
    get :show, format: :json, id: invoice.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal customer.id, result["id"]
    assert_equal customer.first_name, result["first_name"]
    assert_equal customer.last_name, result["last_name"]
  end
end