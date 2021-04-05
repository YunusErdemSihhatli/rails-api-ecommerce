require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "test save product without stock" do
    product = Product.new
    product.name = "Product 007"
    product.price = 1.0

    assert_equal true, product.save
  end

  test "test save product with stock" do
    product = Product.new
    product.name = "Product 007"
    product.price = 1.0
    product.stock = 10

    assert_equal true, product.save
  end

  test "test not save product" do
    product = Product.new

    assert_equal false, product.save
  end

  test "test not save product without price" do
    product = Product.new

    product.name = "Product 007"

    assert_equal false, product.save
  end

  test "test not save product without name" do
    product = Product.new
    product.price = 1.0

    assert_equal false, product.save
  end

  test "test not save product with negative stock" do
    product = Product.new
    product.name = "Product 007"
    product.price = 1.0
    product.stock = -10

    assert_equal false, product.save
  end

end
