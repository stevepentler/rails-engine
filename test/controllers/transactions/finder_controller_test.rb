require 'test_helper'

class Api::V1::Transactions::FinderControllerTest < ActionController::TestCase
  test "#show find id" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, id: transaction_1.id

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.invoice_id, transaction["invoice_id"]
    assert_equal transaction_1.id, transaction["id"]
    assert_equal transaction_1.created_at, transaction["created_at"]
    assert_equal transaction_1.updated_at, transaction["updated_at"]
  end

  test "#show find invoice_id" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, invoice_id: transaction_1.invoice_id

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.invoice_id, transaction["invoice_id"]
    assert_equal transaction_1.id, transaction["id"]
  end

  test "#show find result" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, result: transaction_1.result

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.result, transaction["result"]
    assert_equal transaction_1.id, transaction["id"]
  end

  test "#show find credit card number" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, credit_card_number: transaction_1.credit_card_number

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.credit_card_number, transaction["credit_card_number"]
    assert_equal transaction_1.id, transaction["id"]
  end

  test "#show find created_at" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, created_at: transaction_1.created_at

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.invoice_id, transaction["invoice_id"]
    assert_equal transaction_1.id, transaction["id"]
    assert_equal transaction_1.created_at, transaction["created_at"]
  end

  test "#show find updated_at" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :show, format: :json, updated_at: transaction_1.updated_at

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction_1.invoice_id, transaction["invoice_id"]
    assert_equal transaction_1.id, transaction["id"]
    assert_equal transaction_1.updated_at, transaction["updated_at"]
  end


  # ______________________________________________________

  test "#index find id" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :index, format: :json, id: transaction_1.id

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, transactions.count
    assert_equal transaction_1.id, transactions.first["id"]
    assert_equal transaction_1.invoice_id, transactions.first["invoice_id"]
    assert_equal transaction_1.id, transactions.first["id"]
    assert_equal transaction_1.created_at, transactions.first["created_at"]
    assert_equal transaction_1.updated_at, transactions.first["updated_at"]
  end

  test "#index find invoice_id" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    transaction_2 = Transaction.create(invoice_id: transaction_1.invoice_id)
    get :index, format: :json, invoice_id: transaction_1.invoice_id

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal transaction_1.invoice_id, transactions.first["invoice_id"]
    assert_equal transaction_2.invoice_id, transactions.last["invoice_id"]
  end

  test "#index find credit_card_number" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :index, format: :json, credit_card_number: transaction_1.credit_card_number

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal transaction_1.credit_card_number, transactions.first["credit_card_number"]
    assert_equal transaction_2.credit_card_number, transactions.last["credit_card_number"]
  end

  test "#index find created_at" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :index, format: :json, created_at: transaction_1.created_at

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal transaction_1.created_at, transactions.first["created_at"]
    assert_equal transaction_2.created_at, transactions.last["created_at"]
    assert_equal transaction_1.invoice_id, transactions.first["invoice_id"]
    assert_equal transaction_2.invoice_id, transactions.last["invoice_id"]
  end

  test "#index find updated_at" do 
    transaction_1, transaction_2 = create_list(:transaction, 2)
    get :index, format: :json, updated_at: transaction_1.updated_at

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, transactions.count
    assert_equal transaction_1.invoice_id, transactions.first["invoice_id"]
    assert_equal transaction_1.id, transactions.first["id"]
    assert_equal transaction_1.updated_at, transactions.first["updated_at"]
    assert_equal transaction_2.invoice_id, transactions.last["invoice_id"]
    assert_equal transaction_2.id, transactions.last["id"]
    assert_equal transaction_2.updated_at, transactions.last["updated_at"]
  end

end