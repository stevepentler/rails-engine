require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase
  test "#show" do 
    merchant = create(:merchant)
    item = Item.create(merchant_id: merchant.id)
    
    get :show, format: :json, id: item.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant.id, result["id"]
    assert_equal merchant.name, result["name"]
  end
end