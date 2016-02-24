require 'test_helper'

class Api::V1::Transactions::RandomControllerTest < ActionController::TestCase
  test "#show" do 
    transactions = create(:transaction)
    
    get :show, format: :json, id: transactions.id

    random = JSON.parse(response.body)

    assert_response :success
  end
end