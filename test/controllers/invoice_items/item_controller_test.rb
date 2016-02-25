require "test_helper"

class Api::V1::InvoiceItems::ItemControllerTest < ActionController::TestCase
  test "#show" do
    item = create(:item)
    invoice1, invoice2 = create_list(:invoice, 2)
    invoice_item = InvoiceItem.create(invoice_id: invoice1.id,
                                      item_id: item.id)

    get :show, format: :json, id: invoice_item.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal item.id, result["id"]
    assert_equal item.description, result["description"]
    assert_equal item.merchant_id, result["merchant_id"]
    assert_equal item.created_at, result["created_at"]
    assert_equal item.updated_at, result["updated_at"]
  end 
end

