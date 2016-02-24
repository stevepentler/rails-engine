require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :index, format: :json

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal invoice1.id, invoices.first["id"]
    assert_equal invoice1.customer_id, invoices.first["customer_id"]
    assert_equal invoice1.merchant_id, invoices.first["merchant_id"]
    assert_equal invoice1.created_at, invoices.first["created_at"]
    assert_equal invoice1.updated_at, invoices.first["updated_at"]
    assert_equal invoice2.id, invoices.last["id"]
  end

  test "#show" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, id: invoice1.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice1.id, invoice["id"]
  end
end