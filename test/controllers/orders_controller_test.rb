require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @cart = carts(:three)
    @customer = customers(:one)
  end

  test "test index order" do
    get orders_path

    assert_response :success
  end

  test "test show order" do
    get order_path @order

    json_response = JSON.parse(response.body)
    assert_equal @order.number, json_response["number"]
    assert_equal @order.state, json_response["state"]
    assert_equal @order.total_price, json_response["total_price"].to_f
    assert_equal @order.address, json_response["address"]
    assert_equal @order.products, json_response["products"]
    assert_equal @order.customer_id, json_response["customer"]["id"]
    assert_response :success
  end


  test "test create order" do
    assert_difference('Order.count') do
      post orders_path, params: {
        "order" => {
          "customer_id" => @customer.id,
          "cart_id" => @cart.id,
        }
      }
    end

    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
    assert_response :success
  end

  test "test update order" do
    put order_path @order, params: {
      "state" => 2,
    }

    json_response = JSON.parse(response.body)
    assert_not_equal @order.state, json_response["state"]
    assert_response :success
  end

end
