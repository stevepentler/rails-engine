require 'test_helper'

class Api::V1::Customers::RandomControllerTest < ActionController::TestCase
  test "#show" do 
    customer = create(:customer)
    
    get :show, format: :json

    invoices = JSON.parse(response.body)

    assert_response :success
  end
end