require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do 
    item1 = Item.create(name: "banana",
                        description: "yellow",
                        created_at: "5AM",
                        updated_at: "5PM"
                        )
    item2 = Item.create(name: "boomerang",
                        description: "flies"
                        )

    get :index, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 200, response.status


    assert_equal item1.name, items.first["name"]
    assert_equal item1.description, items.first["description"]

    assert_equal item2.name, items.last["name"]
    assert_equal item2.description, items.last["description"]
  end

  test '#show' do 
    item1 = Item.create(name: "banana",
                        description: "yellow",
                        created_at: "5AM",
                        updated_at: "5PM"
                       )

    get :show, format: :json, id: item1.id

    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 200, response.status


    assert_equal item1.id, result["id"]
    assert_equal item1.name, result["name"]
    assert_equal item1.description, result["description"]
  end

  test '#delete' do 
    item1 = Item.create(name: "banana",
                        description: "yellow",
                        created_at: "5AM",
                        updated_at: "5PM"
                       )

    patch :destroy, format: :json, id: item1.id

    assert_response :success
    assert_equal 204, response.status
  end

  test '#create' do 
    params = {name: "banana", description: "yelllow", created_at: "5AM", updated_at: "5PM"}
    
    post :create, format: :json, params: params

    assert_response :success
    assert_response 201, response.status

    assert_equal item1.id, result["id"]
    assert_equal item1.name, result["name"]
    assert_equal item1.description, result["description"]
  end
end
