require "test_helper"

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "#show" do
    invoice_item = create(:invoice_item)

    get :show, format: :json, id: invoice_item.id

    invoice = JSON.parse(response.body)

    assert_response :success
  end 
end

