require "test_helper"

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "#show" do
    item = create(:item)
    invoice1, invoice2 = create_list(:invoice, 2)
    invoice_item = InvoiceItem.create(invoice_id: invoice1.id,
                                      item_id: item.id)

    get :show, format: :json, id: invoice_item.id

    result = JSON.parse(response.body)

    assert_response :success

    assert_equal invoice1.id, result["id"]
    assert_equal invoice1.customer_id, result["customer_id"]
    assert_equal invoice1.merchant_id, result["merchant_id"]
  end 
end

