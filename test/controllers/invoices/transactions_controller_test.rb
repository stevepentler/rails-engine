require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice = create(:invoice)
    transaction = Transaction.create(invoice_id: invoice.id)
    
    get :index, format: :json, id: invoice.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction.id, result.first["id"]
    assert_equal transaction.invoice_id, result.first["invoice_id"]
    assert_equal transaction.result, result.first["result"]
  end
end