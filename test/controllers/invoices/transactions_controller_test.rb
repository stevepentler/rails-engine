require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase
  test "#index" do 
    invoice = create(:invoice)
    
    get :index, format: :json, id: invoice.id

    transactions = JSON.parse(response.body)

    assert_response :success
  end
end