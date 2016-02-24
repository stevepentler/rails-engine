require 'test_helper'

class Api::V1::Invoices::FinderControllerTest < ActionController::TestCase
  test "#show find id" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, id: invoice1.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end

  test "#show find customer_id" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, customer_id: invoice1.customer_id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end

  test "#show find merchant_id" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, merchant_id: invoice1.merchant_id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end

  test "#show find staus" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, status: invoice1.status

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end

  test "#show find created_at" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, created_at: invoice1.created_at

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end

  test "#show find updated_at" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :show, format: :json, updated_at: invoice1.updated_at

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal Hash, invoice.class
    assert_equal invoice1.customer_id, invoice["customer_id"]
    assert_equal invoice1.merchant_id, invoice["merchant_id"]
    assert_equal invoice1.status, invoice["status"]
    assert_equal invoice1.created_at, invoice["created_at"]
    assert_equal invoice1.updated_at, invoice["updated_at"]
  end


  # # ______________________________________________________




  test "#index find id" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :index, format: :json, id: invoice1.id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, invoices.count
    assert_equal Array, invoices.class
    assert_equal invoice1.id, invoices.first["id"]
    assert_equal invoice1.customer_id, invoices.first["customer_id"]
    assert_equal invoice1.merchant_id, invoices.first["merchant_id"]
    assert_equal invoice1.created_at, invoices.first["created_at"]
    assert_equal invoice1.updated_at, invoices.first["updated_at"]
  end

  test "#index find customer_id" do 
    invoice1, invoice2, invoice3, invoice4, = create_list(:invoice, 5)
    invoice2 = Invoice.create(customer_id: invoice1.customer_id)
    get :index, format: :json, customer_id: invoice1.customer_id

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal Array, invoices.class
    assert_equal 2, invoices.count
    assert_equal invoice1.customer_id, invoices.first["customer_id"]
    assert_equal invoice2.customer_id, invoices.last["customer_id"]

    invoices.each do |invoice|
      assert_equal invoice1.customer_id, invoice["customer_id"]
    end

  end

  # test "#index find uppercase first_name" do 
  #   invoice1, invoice2 = create_list(:invoice, 2)
  #   invoice2 = Invoice.create(first_name: invoice1.first_name)
  #   get :index, format: :json, first_name: invoice1.first_name.upcase

  #   invoices = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal 2, invoices.count
  #   assert_equal invoice1.first_name, invoices.first["first_name"]
  #   assert_equal invoice2.first_name, invoices.last["first_name"]
  # end

  # test "#index find lowercase last_name" do 
  #   invoice1, invoice2 = create_list(:invoice, 2)
  #   invoice2 = Invoice.create(last_name: invoice1.last_name)
  #   get :index, format: :json, last_name: invoice1.last_name.downcase

  #   invoices = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal 2, invoices.count
  #   assert_equal invoice1.last_name, invoices.first["last_name"]
  #   assert_equal invoice2.last_name, invoices.last["last_name"]
  # end

  # test "#index find uppercase last_name" do 
  #   invoice1, invoice2 = create_list(:invoice, 2)
  #   invoice2 = Invoice.create(last_name: invoice1.last_name)
  #   get :index, format: :json, last_name: invoice1.last_name.upcase

  #   invoices = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal 2, invoices.count
  #   assert_equal invoice1.last_name, invoices.first["last_name"]
  #   assert_equal invoice2.last_name, invoices.last["last_name"]
  # end

  # test "#index find created_at" do 
  #   invoice1, invoice2 = create_list(:invoice, 2)
  #   get :index, format: :json, created_at: invoice1.created_at

  #   invoices = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal 2, invoices.count
  #   assert_equal invoice1.created_at, invoices.first["created_at"]
  #   assert_equal invoice2.created_at, invoices.last["created_at"]
  #   assert_equal invoice1.first_name, invoices.first["first_name"]
  #   assert_equal invoice2.first_name, invoices.last["first_name"]
  # end

  # test "#index find updated_at" do 
  #   invoice1, invoice2 = create_list(:invoice, 2)
  #   get :index, format: :json, updated_at: invoice1.updated_at

  #   invoices = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal 2, invoices.count
  #   assert_equal invoice1.first_name, invoices.first["first_name"]
  #   assert_equal invoice1.last_name, invoices.first["last_name"]
  #   assert_equal invoice1.updated_at, invoices.first["updated_at"]
  #   assert_equal invoice2.first_name, invoices.last["first_name"]
  #   assert_equal invoice2.last_name, invoices.last["last_name"]
  #   assert_equal invoice2.updated_at, invoices.last["updated_at"]
  # end
end