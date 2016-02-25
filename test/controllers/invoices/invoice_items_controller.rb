require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice = create(:invoice)
    5.times do 
      InvoiceItem.create(invoice_id: invoice.id,
                         quantity: 4)
    end
    
    get :index, format: :json, id: invoice.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 5, result.count
    assert_equal 4, result.first["quantity"]
  end
end