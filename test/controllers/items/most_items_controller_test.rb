require 'test_helper'

class Api::V1::Items::MostItemsControllerTest < ActionController::TestCase

  test "#index most items sold" do
    customer = create(:customer)
    merchant= create(:merchant)

    invoice = Invoice.create(customer_id: customer.id, 
                             merchant_id: merchant.id, 
                             status: "shipped")

    10.times do 
      Transaction.create(invoice_id: invoice.id, 
                         result: "success")
    end

    item1 = Item.create(name: "boomerang",
                        description: "flies",
                        unit_price: 1,
                        merchant_id: merchant.id)

    item2 = Item.create(name: "bike",
                        description: "rolls",
                        unit_price: 100,
                        merchant_id: merchant.id)

    toy1 =  InvoiceItem.create(item_id: item1.id,
                         invoice_id: invoice.id,
                         quantity: 100,
                         unit_price: 100)

    toy2 =  InvoiceItem.create(item_id: item2.id,
                     invoice_id: invoice.id,
                     quantity: 1,
                     unit_price: 1)

    get :index, format: :json, quantity: 1

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal item1.id, result.first["id"]
    assert_equal item1.name, result.first["name"]
    assert_equal "1.0", result.first["unit_price"]
    assert_equal item1.merchant_id, result.first["merchant_id"]

  end
end