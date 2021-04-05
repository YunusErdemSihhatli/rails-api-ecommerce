require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
    @address = addresses(:one)
  end

  test "test show address" do
    get address_path @address

    json_response = JSON.parse(response.body)
    assert_equal @address.first_name, json_response["first_name"]
    assert_equal @address.last_name, json_response["last_name"]
    assert_equal @address.phone, json_response["phone"]
    assert_equal @address.title, json_response["title"]
    assert_equal @address.description, json_response["description"]
    assert_equal @address.city_name, json_response["city_name"]
    assert_equal @address.town_name, json_response["town_name"]
    assert_response :success
  end

  test "test create address" do
    assert_difference('Address.count') do
      post addresses_path, params: {
        "address" => {
          "customer_id" => @customer.id,
          "first_name" => "Yunus Erdem",
          "last_name" => "Sıhhatlı",
          "phone" => "(530) 123 45 67",
          "title" => "Ev",
          "description" => "Deneme Mahalle, Deneme Sokak, No: 1, D: 1, Deneme / Deneme",
          "city_name" => "Deneme",
          "town_name" => "Deneme",
        }
      }
    end

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test update address" do
    put address_path @address, params: {
      "address" => {
        "customer_id" => @customer.id,
        "first_name" => "Yunus Erdem",
        "last_name" => "Sıhhatlı",
        "phone" => "(530) 123 45 67",
        "title" => "Ev",
        "description" => "Deneme Mahalle, Deneme Sokak, No: 1, D: 1, Deneme / Deneme",
        "city_name" => "Deneme",
        "town_name" => "Deneme",
      }
    }

    json_response = JSON.parse(response.body)
    assert_not_equal @address.first_name, json_response["first_name"]
    assert_not_equal @address.last_name, json_response["last_name"]
    assert_not_equal @address.phone, json_response["phone"]
    assert_not_equal @address.title, json_response["title"]
    assert_not_equal @address.description, json_response["description"]
    assert_not_equal @address.city_name, json_response["city_name"]
    assert_not_equal @address.town_name, json_response["town_name"]
    assert_response :success
  end

end
