require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do 
    merchant1, merchant2 = create_list(:merchant, 2)
    get :index, format: :json

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal merchant1.name, merchants.first["name"]
    assert_equal merchant1.created_at, merchants.first["created_at"]
    assert_equal merchant1.updated_at, merchants.first["updated_at"]
    assert_equal merchant2.name, merchants.last["name"]
  end

  test "#show" do 
    merchant1, merchant2 = create_list(:merchant, 2)
    get :show, format: :json, id: merchant1.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant1.name, merchant["name"]
    assert_equal merchant1.created_at, merchant["created_at"]
    assert_equal merchant1.updated_at, merchant["updated_at"]
  end
end