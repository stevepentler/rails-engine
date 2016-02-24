require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice = create(:invoice)
    
    get :index, format: :json, id: invoice.id

    invoices = JSON.parse(response.body)

    assert_response :success
  end
end