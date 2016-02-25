require 'test_helper'

class Api::V1::InvoiceItems::FinderControllerTest < ActionController::TestCase
  test "#show find id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, id: invoice_item1.id

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.quantity, invoice_item["quantity"]
    assert_equal invoice_item1.invoice_id, invoice_item["invoice_id"]
    assert_equal invoice_item1.item_id, invoice_item["item_id"]
    assert_equal invoice_item1.updated_at, invoice_item["updated_at"]
    assert_equal invoice_item1.created_at, invoice_item["created_at"]
  end

  test "#show find item_id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, item_id: invoice_item1.item_id

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, invoice_item["id"]
    assert_equal invoice_item1.item_id, invoice_item["item_id"]
    refute_equal invoice_item2.id, invoice_item["id"]
    refute_equal invoice_item2.item_id, invoice_item["item_id"]
  end

  test "#show find invoice_id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, invoice_id: invoice_item1.invoice_id

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, invoice_item["id"]
    assert_equal invoice_item1.invoice_id, invoice_item["invoice_id"]
    refute_equal invoice_item2.id, invoice_item["id"]
    refute_equal invoice_item2.invoice_id, invoice_item["invoice_id"]
  end

  test "#show find quantity" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    invoice_item2.update(quantity: 1919)
    get :show, format: :json, quantity: invoice_item1.quantity

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, invoice_item["id"]
    assert_equal invoice_item1.quantity, invoice_item["quantity"]
    refute_equal invoice_item2.id, invoice_item["id"]
    refute_equal invoice_item2.invoice_id, invoice_item["invoice_id"]
  end

  test "#show find created_at" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, created_at: invoice_item1.created_at

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, invoice_item["id"]
    assert_equal invoice_item1.quantity, invoice_item["quantity"]
    assert_equal invoice_item1.created_at, invoice_item["created_at"]
  end

  test "#show find updated_at" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :show, format: :json, updated_at: invoice_item1.updated_at

    invoice_item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.id, invoice_item["id"]
    assert_equal invoice_item1.quantity, invoice_item["quantity"]
    assert_equal invoice_item1.updated_at, invoice_item["updated_at"]
  end


  # # ______________________________________________________
  # # ______________________________________________________
  # # ______________________________________________________

  test "#index find id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :index, format: :json, id: invoice_item1.id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item1.invoice_id, invoice_items.first["invoice_id"]
    assert_equal invoice_item1.item_id, invoice_items.first["item_id"]
    assert_equal invoice_item1.updated_at, invoice_items.first["updated_at"]
    assert_equal invoice_item1.created_at, invoice_items.first["created_at"]
  end

  test "#index find item_id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :index, format: :json, item_id: invoice_item1.item_id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.item_id, invoice_items.first["item_id"]
  end

  test "#index find invoice_id" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    invoice_item2.update(invoice_id: invoice_item1.invoice_id)
    get :index, format: :json, invoice_id: invoice_item1.invoice_id

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.invoice_id, invoice_items.first["invoice_id"]
    assert_equal invoice_item2.id, invoice_items.last["id"]
    assert_equal invoice_item2.invoice_id, invoice_items.last["invoice_id"]
  end

  test "#index find quantity" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    invoice_item2.update(quantity: invoice_item1.quantity)
    get :index, format: :json, quantity: invoice_item1.quantity

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.quantity, invoice_items.first["quantity"]
    assert_equal invoice_item2.id, invoice_items.last["id"]
    assert_equal invoice_item2.quantity, invoice_items.last["quantity"]
  end

  test "#index find created_at" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :index, format: :json, created_at: invoice_item1.created_at

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.quantity, invoice_items.first["quantity"]
    assert_equal invoice_item1.created_at, invoice_items.first["created_at"]
    assert_equal invoice_item2.id, invoice_items.last["id"]
    assert_equal invoice_item2.quantity, invoice_items.last["quantity"]
    assert_equal invoice_item2.created_at, invoice_items.last["created_at"]
  end

  test "#index find updated_at" do 
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
    get :index, format: :json, updated_at: invoice_item1.updated_at

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoice_items.count
    assert_equal invoice_item1.id, invoice_items.first["id"]
    assert_equal invoice_item1.quantity, invoice_items.first["quantity"]
    assert_equal invoice_item1.updated_at, invoice_items.first["updated_at"]
    assert_equal invoice_item2.id, invoice_items.last["id"]
    assert_equal invoice_item2.quantity, invoice_items.last["quantity"]
    assert_equal invoice_item2.updated_at, invoice_items.last["updated_at"]
  end
end