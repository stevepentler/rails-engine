require 'test_helper'

class Api::V1::Merchants::FavoriteCustomerControllerTest < ActionController::TestCase

  test "#show favorite customer for merchant" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)

    customer1_invoice = Invoice.create(customer_id: customer1.id, 
                             merchant_id: merchant.id, 
                             status: "shipped")

    customer2_invoice = Invoice.create(customer_id: customer2.id, 
                         merchant_id: merchant.id, 
                         status: "shipped")

    5.times do 
        transaction = Transaction.create(invoice_id: customer1_invoice.id, result: "success")
    end

    2.times do 
      transaction = Transaction.create(invoice_id: customer2_invoice.id, result: "success")
    end

    get :show, format: :json, id: merchant.id

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal customer1.id, result["id"]
    assert_equal customer1.first_name, result["first_name"]
    assert_equal customer1.last_name, result["last_name"]
    assert_equal customer1.created_at, result["created_at"]
  end
end