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

  test "#index find status" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    invoice3 = Invoice.create(status: "failure")
    get :index, format: :json, status: invoice1.status

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal invoice1.status, invoices.first["status"]
    assert_equal invoice2.status, invoices.last["status"]
  end

  test "#index find uppercase merchant_id" do 
    merchant = create(:merchant)
    invoice1 = Invoice.create(merchant_id: merchant.id)
    invoice2 = Invoice.create(merchant_id: merchant.id)
    invoice3 = create(:invoice)
    
    get :index, format: :json, merchant_id: invoice1.merchant_id  

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal invoice1.merchant_id, invoices.first["merchant_id"]
    assert_equal invoice2.merchant_id, invoices.last["merchant_id"]
  end

  test "#index find created_at" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :index, format: :json, created_at: invoice1.created_at

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal invoice1.created_at, invoices.first["created_at"]
    assert_equal invoice2.created_at, invoices.last["created_at"]
    assert_equal invoice1.customer_id, invoices.first["customer_id"]
    assert_equal invoice2.customer_id, invoices.last["customer_id"]
  end

  test "#index find updated_at" do 
    invoice1, invoice2 = create_list(:invoice, 2)
    get :index, format: :json, updated_at: invoice1.updated_at

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.count
    assert_equal invoice1.customer_id, invoices.first["customer_id"]
    assert_equal invoice1.merchant_id, invoices.first["merchant_id"]
    assert_equal invoice1.updated_at, invoices.first["updated_at"]
    assert_equal invoice2.customer_id, invoices.last["customer_id"]
    assert_equal invoice2.merchant_id, invoices.last["merchant_id"]
    assert_equal invoice2.updated_at, invoices.last["updated_at"]
  end
end