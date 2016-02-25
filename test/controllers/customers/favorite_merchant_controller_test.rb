require 'test_helper'

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionController::TestCase

  test "#show favorite merchant for customer" do
    customer = create(:customer)
    merchant1, merchant2 = create_list(:merchant, 2)

    merchant1_invoice = Invoice.create(customer_id: customer.id, 
                             merchant_id: merchant1.id, 
                             status: "shipped")

    merchant2_invoice = Invoice.create(customer_id: customer.id, 
                         merchant_id: merchant2.id, 
                         status: "shipped")

    5.times do 
        transaction = Transaction.create(invoice_id: merchant1_invoice.id, result: "success")
    end

    2.times do 
      transaction = Transaction.create(invoice_id: merchant2_invoice.id, result: "success")
    end

    get :show, format: :json, id: customer.id

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal merchant1.id, result["id"]
    assert_equal merchant1.name, result["name"]
  end
end