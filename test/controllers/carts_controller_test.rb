require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
    @customer = customers(:one)
    @address = addresses(:one)
    @product = products(:one)
    @new_product = products(:three)
  end

  test "test show cart" do
    get cart_path @cart

    json_response = JSON.parse(response.body)
    assert_equal @cart.customer_id, json_response["customer_id"]
    assert_equal @cart.address_id, json_response["address"]["id"]
    assert_equal @cart.order_id, json_response["order_id"]
    assert_response :success
  end

  test "test create cart" do
    assert_difference('Cart.count') do
      post carts_path, params: {
        "cart" => {
          "customer_id" => @customer.id,
        }
      }
    end

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test update cart" do
    put cart_path @cart, params: {
      "cart" => {
        "customer_id" => @customer.id,
        "address_id" => @address.id,
      }
    }

    json_response = JSON.parse(response.body)
    assert_equal @address.id, json_response["address"]["id"]
    assert_equal @customer.id, json_response["customer_id"]
    assert_response :success
  end

  test "test create line item" do
    post create_line_item_cart_path @cart, params: {
      "line_item" => {
        "cart_id" => @cart.id,
        "product_id" => @new_product.id,
      }
    }

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test create line item without cart_id" do
    post create_line_item_cart_path @cart, params: {
      "line_item" => {
        "product_id" => @new_product.id,
      }
    }

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test update line item without cart_id" do
    put update_line_item_cart_path @cart, params: {
      "line_item" => {
        "product_id" => @product.id,
        "piece" => 5,
      }
    }

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test not create line item with same product" do
    post create_line_item_cart_path @cart, params: {
      "line_item" => {
        "product_id" => @product.id,
      }
    }

    json_response = JSON.parse(response.body)
    assert_equal false, json_response["success"]
    assert_response :success
  end

end
