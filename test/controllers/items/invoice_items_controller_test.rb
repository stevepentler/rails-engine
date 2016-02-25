require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do 
    item = create(:item)
    invoice_item = InvoiceItem.create(item_id: item.id)
    
    get :index, format: :json, id: item.id

    result = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice_item.id, result.first["id"]
    assert_equal invoice_item.item_id, result.first["item_id"]
  end
end