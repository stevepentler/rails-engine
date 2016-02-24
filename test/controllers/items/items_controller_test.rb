require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do 
    item1, item2 = create_list(:item, 2)
    get :index, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, items.count
    assert_equal item1.name, items.first["name"]
    assert_equal item1.description, items.first["description"]
    assert_equal item1.created_at, items.first["created_at"]
    assert_equal item1.updated_at, items.first["updated_at"]
    assert_equal item2.name, items.last["name"]
  end

  test "#show" do 
    item1, item2 = create_list(:item, 2)
    get :show, format: :json, id: item1.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal item1.name, item["name"]
    assert_equal item1.description, item["description"]
    assert_equal item1.created_at, item["created_at"]
    assert_equal item1.updated_at, item["updated_at"]
  end
end
