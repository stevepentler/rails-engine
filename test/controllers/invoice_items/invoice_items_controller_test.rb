require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :index, format: :json

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.quantity, invoice_items.first["quantity"]
    assert_equal invoice_item1.created_at, invoice_items.first["created_at"]
    assert_equal invoice_item1.updated_at, invoice_items.first["updated_at"]
    assert_equal invoice_item2.id, invoice_items.last["id"]
    assert_equal invoice_item2.quantity, invoice_items.last["quantity"]
    assert_equal invoice_item2.created_at, invoice_items.last["created_at"]
    assert_equal invoice_item2.updated_at, invoice_items.last["updated_at"]
  end

  test "#show" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, id: invoice_item1.id

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, customer["id"]
    assert_equal invoice_item1.quantity, customer["quantity"]
    assert_equal invoice_item1.created_at, customer["created_at"]
    assert_equal invoice_item1.updated_at, customer["updated_at"]
  end

end