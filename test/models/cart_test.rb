require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do
    @customer = customers(:one)
    @address = addresses(:one)
    @cart = carts(:three)
    @order = orders(:one)
  end

  test "test save cart" do
    cart = Cart.new
    cart.customer_id = @customer.id

    assert_equal true, cart.save
  end

  test "test save cart with address" do
    cart = Cart.new
    cart.customer_id = @customer.id
    cart.address_id = @address.id

    assert_equal true, cart.save
  end

  test "test not save cart" do
    cart = Cart.new

    assert_equal false, cart.save
  end

  test "test not save cart with address" do
    cart = Cart.new
    cart.address_id = @address.id

    assert_equal false, cart.save
  end

  test "test update cart address" do
    assert_equal true, @cart.update(address_id: @address.id)
  end

  test "test update cart order_id" do
    assert_equal true, @cart.update(order_id: @order.id)
  end

end
