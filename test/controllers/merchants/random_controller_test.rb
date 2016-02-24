require 'test_helper'

class Api::V1::Merchants::RandomControllerTest < ActionController::TestCase
  test "#show" do 
    merchant = create(:merchant)
    
    get :show, format: :json, id: merchant.id

    merchants = JSON.parse(response.body)

    assert_response :success
  end
end