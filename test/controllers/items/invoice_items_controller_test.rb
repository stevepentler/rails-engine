require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do 
    item = create(:item)
    
    get :index, format: :json, id: item.id

    invoice_items = JSON.parse(response.body)

    assert_response :success
  end
end