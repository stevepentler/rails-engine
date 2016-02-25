require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "#index" do 
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id,
                             status: "shipped")

    10.times do 
      Transaction.create(invoice_id: invoice.id)
    end
    
    get :index, format: :json, id: customer.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 10, result.count
    assert_equal invoice.id, result.first["invoice_id"]
  end
end