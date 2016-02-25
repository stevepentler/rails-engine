require 'test_helper'

class Api::V1::Merchants::FinderControllerTest < ActionController::TestCase
  test "#show find id" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :show, format: :json, id: merchant_1.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant_1.name, merchant["name"]
    assert_equal merchant_1.id, merchant["id"]
    assert_equal merchant_1.created_at, merchant["created_at"]
    assert_equal merchant_1.updated_at, merchant["updated_at"]
  end

  test "#show find lowercase name" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :show, format: :json, name: merchant_1.name.downcase

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant_1.name, merchant["name"]
    assert_equal merchant_1.id, merchant["id"]
  end

  test "#show find upcase name" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :show, format: :json, name: merchant_1.name.upcase

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant_1.name, merchant["name"]
    assert_equal merchant_1.id, merchant["id"]
  end

  test "#show find created_at" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :show, format: :json, created_at: merchant_1.created_at

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant_1.name, merchant["name"]
    assert_equal merchant_1.id, merchant["id"]
    assert_equal merchant_1.created_at, merchant["created_at"]
  end

  test "#show find updated_at" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :show, format: :json, updated_at: merchant_1.updated_at

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal merchant_1.name, merchant["name"]
    assert_equal merchant_1.id, merchant["id"]
    assert_equal merchant_1.updated_at, merchant["updated_at"]
  end


  # ______________________________________________________

  test "#index find id" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :index, format: :json, id: merchant_1.id

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, merchants.count
    assert_equal merchant_1.id, merchants.first["id"]
    assert_equal merchant_1.name, merchants.first["name"]
    assert_equal merchant_1.id, merchants.first["id"]
    assert_equal merchant_1.created_at, merchants.first["created_at"]
    assert_equal merchant_1.updated_at, merchants.first["updated_at"]
  end

  test "#index find lowercase name" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    merchant_2 = Merchant.create(name: merchant_1.name)
    get :index, format: :json, name: merchant_1.name.downcase

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal merchant_1.name, merchants.first["name"]
    assert_equal merchant_2.name, merchants.last["name"]
  end

  test "#index find uppercase name" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    merchant_2 = Merchant.create(name: merchant_1.name)
    get :index, format: :json, name: merchant_1.name.upcase

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal merchant_1.name, merchants.first["name"]
    assert_equal merchant_2.name, merchants.last["name"]
  end

  test "#index find created_at" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :index, format: :json, created_at: merchant_1.created_at

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal merchant_1.created_at, merchants.first["created_at"]
    assert_equal merchant_2.created_at, merchants.last["created_at"]
    assert_equal merchant_1.name, merchants.first["name"]
    assert_equal merchant_2.name, merchants.last["name"]
  end

  test "#index find updated_at" do 
    merchant_1, merchant_2 = create_list(:merchant, 2)
    get :index, format: :json, updated_at: merchant_1.updated_at

    merchants = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, merchants.count
    assert_equal merchant_1.name, merchants.first["name"]
    assert_equal merchant_1.id, merchants.first["id"]
    assert_equal merchant_1.updated_at, merchants.first["updated_at"]
    assert_equal merchant_2.name, merchants.last["name"]
    assert_equal merchant_2.id, merchants.last["id"]
    assert_equal merchant_2.updated_at, merchants.last["updated_at"]
  end
end