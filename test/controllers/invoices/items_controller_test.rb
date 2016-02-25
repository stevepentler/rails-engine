require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice = create(:invoice)
    item = create(:item)
    5.times do 
      invoice_item = InvoiceItem.create(invoice_id: invoice.id,
                                      item_id: item.id)
    end
    
    
    get :index, format: :json, id: invoice.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 5, result.count
    assert_equal item.name, result.first["name"]
    assert_equal item.description, result.first["description"]
    assert_equal item.created_at, result.first["created_at"]
  end
end