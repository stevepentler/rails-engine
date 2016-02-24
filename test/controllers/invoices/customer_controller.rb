require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "#show" do 
    invoice = create(:invoice)
    
    get :show, format: :json, id: invoice.id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal fuck, invoice.id
  end
end