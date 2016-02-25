require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "#index" do 
    customer = create(:customer)
    merchant = create(:merchant)

    10.times do 
      Invoice.create(customer_id: customer.id,
                     merchant_id: merchant.id,
                     status: "shipped")
    end
    
    get :index, format: :json, id: customer.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 10, result.count
    assert_equal customer.id, result.first["customer_id"]
    assert_equal merchant.id, result.first["merchant_id"]
  end
end