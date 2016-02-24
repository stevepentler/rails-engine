require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :index, format: :json

    customers = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, customers.count
    assert_equal customer_1.first_name, customers.first["first_name"]
    assert_equal customer_1.last_name, customers.first["last_name"]
    assert_equal customer_1.created_at, customers.first["created_at"]
    assert_equal customer_1.updated_at, customers.first["updated_at"]
    assert_equal customer_2.first_name, customers.last["first_name"]
  end

  test "#show" do 
    customer_1, customer_2 = create_list(:customer, 2)
    get :show, format: :json, id: customer_1.id

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal customer_1.first_name, customer["first_name"]
    assert_equal customer_1.last_name, customer["last_name"]
    assert_equal customer_1.created_at, customer["created_at"]
    assert_equal customer_1.updated_at, customer["updated_at"]
  end

end