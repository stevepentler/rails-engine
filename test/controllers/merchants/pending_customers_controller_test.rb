require 'test_helper'

class Api::V1::Merchants::PendingCustomersControllerTest < ActionController::TestCase

  test "#index pending customers for merchant" do
    customer1, customer2, customer3 = create_list(:customer, 3)
    merchant= create(:merchant)

    customer1_invoice = Invoice.create(customer_id: customer1.id, 
                             merchant_id: merchant.id)

    customer2_invoice = Invoice.create(customer_id: customer2.id, 
                         merchant_id: merchant.id)

    3.times do 
      Transaction.create(invoice_id: customer1_invoice.id, 
                         result: "failed")
    end

    10.times do 
      Transaction.create(invoice_id: customer2_invoice.id, 
                         result: "failed")
    end

    get :index, format: :json, id: merchant.id

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal 2, result.count
    # assert_equal customer2.id, result.first["id"] 
    # assert_equal customer1.id, result.last["id"]
  end
end