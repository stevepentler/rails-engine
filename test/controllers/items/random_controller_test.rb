require 'test_helper'

class Api::V1::Items::RandomControllerTest < ActionController::TestCase
  test "#show" do 
    item = create(:item)
    
    get :show, format: :json, id: item.id

    items = JSON.parse(response.body)

    assert_response :success
  end
end