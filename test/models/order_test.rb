require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @customer = customers(:one)
    @address = addresses(:one)
    @cart = carts(:one)
    @order = orders(:one)
  end

  test "test save order" do
    order = Order.new
    order.customer_id = @customer.id
    order.cart_id = @cart.id

    assert_equal true, order.save!
  end

  test "test not save order" do
    order = Order.new

    assert_equal false, order.save
  end

  test "test not save order without customer" do
    order = Order.new
    order.cart_id = @cart.id

    assert_equal false, order.save
  end

  test "test not save order without cart" do
    order = Order.new
    order.customer_id = @customer.id

    assert_equal false, order.save
  end

end
