require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase

  test "#show revenue for merchant" do
    time = Time.now
    customer = create(:customer)
    merchant= create(:merchant)

    invoice = Invoice.create(customer_id: customer.id, 
                             merchant_id: merchant.id, 
                             status: "shipped")

    10.times do 
      Transaction.create(invoice_id: invoice.id, 
                         result: "success")
    end

    item = Item.create(name: "boomerang",
                       description: "flies",
                       unit_price: 1,
                       merchant_id: merchant.id)

    10.times do 
      InvoiceItem.create(item_id: item.id,
                         invoice_id: invoice.id,
                         quantity: 1,
                         unit_price: 1)
    end

    get :show, format: :json, id: merchant.id

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal "100.0", result["revenue"]
    # $1* 10 InvoiceItems * 10 Transactions
  end

  test "#show revenue for merchant by date" do
    time = Time.now
    customer = create(:customer)
    merchant= create(:merchant)

    invoice = Invoice.create(customer_id: customer.id, 
                             merchant_id: merchant.id, 
                             status: "shipped",
                             created_at: time)

    10.times do 
      Transaction.create(invoice_id: invoice.id, 
                         result: "success")
    end

    item = Item.create(name: "boomerang",
                       description: "flies",
                       unit_price: 1,
                       merchant_id: merchant.id)

    5.times do 
      InvoiceItem.create(item_id: item.id,
                         invoice_id: invoice.id,
                         quantity: 1,
                         unit_price: 1)
    end

    get :show, format: :json, id: merchant.id, date: time

    result = JSON.parse(response.body)
    
    assert_response :success

    assert_equal "50.0", result["revenue"]
    # $1* 5 InvoiceItems * 10 Transactions
  end
end