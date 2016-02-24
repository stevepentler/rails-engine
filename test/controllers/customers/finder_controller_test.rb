require 'test_helper'

class Api::V1::Customers::FinderControllerTest < ActionController::TestCase
  test "#show find id" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, id: customer_1.id

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
    assert_equal customer_1.created_at, customer["created_at"]
    assert_equal customer_1.updated_at, customer["updated_at"]
  end

  test "#show find lowercase first_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, first_name: customer_1.first_name.downcase

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
  end

  test "#show find upcase first_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, first_name: customer_1.first_name.upcase

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
  end

  test "#show find downcase last_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, last_name: customer_1.last_name.downcase

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
  end

  test "#show find upcase last_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, last_name: customer_1.last_name.upcase

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
  end

  test "#show find created_at" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, created_at: customer_1.created_at

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
    assert_equal customer_1.created_at, customer["created_at"]
  end

  test "#show find updated_at" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, updated_at: customer_1.updated_at

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
    assert_equal customer_1.updated_at, customer["updated_at"]
  end


  # ______________________________________________________

  test "#index find id" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :index, format: :json, id: customer_1.id

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, customers.count
    assert_equal customer_1.id, customers.first["id"]
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_1.last_name, customers.first["last_name"]
    assert_equal customer_1.created_at, customers.first["created_at"]
    assert_equal customer_1.updated_at, customers.first["updated_at"]
  end

  test "#index find lowercase first_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    customer_2 = Customer.create(first_name: customer_1.first_name)
    get :index, format: :json, first_name: customer_1.first_name.downcase

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_2.first_name, customers.last["first_name"]
  end

  test "#index find uppercase first_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    customer_2 = Customer.create(first_name: customer_1.first_name)
    get :index, format: :json, first_name: customer_1.first_name.upcase

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_2.first_name, customers.last["first_name"]
  end

  test "#index find lowercase last_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    customer_2 = Customer.create(last_name: customer_1.last_name)
    get :index, format: :json, last_name: customer_1.last_name.downcase

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.last_name, customers.first["last_name"]
    assert_equal customer_2.last_name, customers.last["last_name"]
  end

  test "#index find uppercase last_name" do 
    customer_1, customer_2 = create_list(:customer, 2)
    customer_2 = Customer.create(last_name: customer_1.last_name)
    get :index, format: :json, last_name: customer_1.last_name.upcase

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.last_name, customers.first["last_name"]
    assert_equal customer_2.last_name, customers.last["last_name"]
  end

  test "#index find created_at" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :index, format: :json, created_at: customer_1.created_at

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.created_at, customers.first["created_at"]
    assert_equal customer_2.created_at, customers.last["created_at"]
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_2.first_name, customers.last["first_name"]
  end

  test "#index find updated_at" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :index, format: :json, updated_at: customer_1.updated_at

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_1.last_name, customers.first["last_name"]
    assert_equal customer_1.updated_at, customers.first["updated_at"]
    assert_equal customer_2.first_name, customers.last["first_name"]
    assert_equal customer_2.last_name, customers.last["last_name"]
    assert_equal customer_2.updated_at, customers.last["updated_at"]
  end
end