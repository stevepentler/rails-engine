require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "#index" do 
    merchant = create(:merchant)
    
    get :index, format: :json, id: merchant.id

    items = JSON.parse(response.body)

    assert_response :success
  end
end