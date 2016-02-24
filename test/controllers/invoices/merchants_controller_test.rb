require 'test_helper'

class Api::V1::Invoices::MerchantControllerTest < ActionController::TestCase
  test "#show" do 
    invoice = create(:invoice)
    
    get :show, format: :json, id: invoice.id

    invoices = JSON.parse(response.body)

    assert_response :success
  end
end