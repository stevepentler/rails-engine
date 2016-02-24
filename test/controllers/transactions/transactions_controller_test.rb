require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do 
    transaction1, transaction2 = create_list(:transaction, 2)
    get :index, format: :json

    transactinos = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactinos.count
    assert_equal transaction1.invoice_id, transactinos.first["invoice_id"]
    assert_equal transaction1.result, transactinos.first["result"]
    assert_equal transaction1.created_at, transactinos.first["created_at"]
    assert_equal transaction1.updated_at, transactinos.first["updated_at"]
    assert_equal transaction2.invoice_id, transactinos.last["invoice_id"]
  end

  test "#show" do 
    transaction1, transaction2 = create_list(:transaction, 2)
    get :show, format: :json, id: transaction1.id

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction1.invoice_id, transaction["invoice_id"]
    assert_equal transaction1.result, transaction["result"]
    assert_equal transaction1.created_at, transaction["created_at"]
    assert_equal transaction1.updated_at, transaction["updated_at"]
  end
end