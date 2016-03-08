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

    assert_equal item1.name, items.first["name"]
    assert_equal item1.description, items.first["description"]
    assert_equal item2.name, items.last["name"]
    assert_equal item2.description, items.last["description"]
  end
end
