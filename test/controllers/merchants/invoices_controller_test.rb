require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  test "#index" do 
    merchant = create(:merchant)
    
    get :index, format: :json, id: merchant.id

    invoices = JSON.parse(response.body)

    assert_response :success
  end
end