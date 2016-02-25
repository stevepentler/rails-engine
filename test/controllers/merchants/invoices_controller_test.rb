require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  test "#index" do 
    merchant = create(:merchant)
    5.times do 
      Invoice.create(merchant_id: merchant.id)
    end
    
    get :index, format: :json, id: merchant.id

    result = JSON.parse(response.body)

    assert_response :success

    assert_equal 5, merchant.invoices.count
    assert_equal merchant.id, result.first["merchant_id"]
    assert_equal merchant.id, result.last["merchant_id"]
  end
end