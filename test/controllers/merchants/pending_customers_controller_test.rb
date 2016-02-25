require 'test_helper'

class Api::V1::Merchants::PendingCustomersControllerTest < ActionController::TestCase

  test "#index pending customers for merchant" do
    customer1, customer2, customer3 = create_list(:customer, 3)
    merchant= create(:merchant)

    customer1_invoice = Invoice.create(customer_id: customer1.id, 
                             merchant_id: merchant.id)

    customer2_invoice = Invoice.create(customer_id: customer2.id, 
                         merchant_id: merchant.id)

    5.times do 
      Transaction.create(invoice_id: customer1_invoice.id, 
                         result: "failed")
    end

    3.times do 
      Transaction.create(invoice_id: customer2_invoice.id, 
                         result: "failed")
    end

    get :index, format: :json, id: merchant.id

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal 2, result.count
    assert_equal customer1.id, result.first["id"]
    assert_equal customer1.first_name, result.first["first_name"]
    assert_equal customer1.last_name, result.first["last_name"]
    assert_equal customer2.id, result.last["id"]
    assert_equal customer2.first_name, result.last["first_name"]
    assert_equal customer2.last_name, result.last["last_name"]
  end
end