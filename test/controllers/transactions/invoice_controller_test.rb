require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "#show" do 
    transactions = create(:transaction)
    
    get :show, format: :json, id: transactions.id

    invoice = JSON.parse(response.body)

    assert_response :success
  end
end