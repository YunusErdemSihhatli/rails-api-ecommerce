require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "test show address" do
    get customer_path @customer

    json_response = JSON.parse(response.body)
    assert_equal @customer.first_name, json_response["first_name"]
    assert_equal @customer.last_name, json_response["last_name"]
    assert_equal @customer.email, json_response["email"]
    assert_response :success
  end

  test "test create address" do
    assert_difference('Customer.count') do
      post customers_path, params: {
        "customer" => {
          "first_name" => "Yunus Erdem",
          "last_name" => "Sıhhatlı",
          "email" => "yunuserdemsihhatli@gmail.com",
        }
      }
    end

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test update address" do
    put customer_path @customer, params: {
      "customer" => {
        "first_name" => "Yunus Erdem",
        "last_name" => "Sıhhatlı",
        "email" => "yunuserdemsihhatli@gmail.com",
      }
    }

    json_response = JSON.parse(response.body)
    assert_not_equal @customer.first_name, json_response["first_name"]
    assert_not_equal @customer.last_name, json_response["last_name"]
    assert_not_equal @customer.email, json_response["email"]
    assert_response :success
  end

end
