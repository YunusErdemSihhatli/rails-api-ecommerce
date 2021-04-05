require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
    @new_product = products(:three)
    @cart = carts(:one)
  end

  test "test save line item" do
    line_item = LineItem.new
    line_item.piece = 1
    line_item.product_id = @new_product.id
    line_item.cart_id = @cart.id

    assert_equal true, line_item.save
  end

  test "test save line item without piece" do
    line_item = LineItem.new
    line_item.product_id = @new_product.id
    line_item.cart_id = @cart.id

    assert_equal true, line_item.save
  end

  test "test not save line item" do
    line_item = LineItem.new

    assert_equal false, line_item.save
  end

  test "test not save line item with piece" do
    line_item = LineItem.new
    line_item.piece = 1

    assert_equal false, line_item.save
  end

  test "test not save line item with product_id" do
    line_item = LineItem.new
    line_item.product_id = @product.id

    assert_equal false, line_item.save
  end

  test "test not save line item with cart_id" do
    line_item = LineItem.new
    line_item.cart_id = @cart.id

    assert_equal false, line_item.save
  end

  test "test not save line item without product" do
    line_item = LineItem.new
    line_item.piece = 1
    line_item.cart_id = @cart.id

    assert_equal false, line_item.save
  end

  test "test not save line item without cart" do
    line_item = LineItem.new
    line_item.piece = 1
    line_item.product_id = @product.id

    assert_equal false, line_item.save
  end

  test "test not save line item with negative piece" do
    line_item = LineItem.new
    line_item.piece = -1
    line_item.product_id = @product.id
    line_item.cart_id = @cart.id

    assert_equal false, line_item.save
  end

end
