require "test_helper"

class CustomerTest < ActiveSupport::TestCase

  test "test save customer" do
    customer = Customer.new
    customer.first_name = "Yunus Erdem"
    customer.last_name = "Sıhhatlı"
    customer.email = "yunuserdemsihhatli@gmail.com"

    assert_equal true, customer.save
  end

  test "test not save customer" do
    customer = Customer.new

    assert_equal false, customer.save
  end

  test "test not save customer without first name" do
    customer = Customer.new
    customer.last_name = "Sıhhatlı"
    customer.email = "yunuserdemsihhatli@gmail.com"

    assert_equal false, customer.save
  end

  test "test not save customer without last name" do
    customer = Customer.new
    customer.first_name = "Yunus Erdem"
    customer.email = "yunuserdemsihhatli@gmail.com"

    assert_equal false, customer.save
  end

  test "test not save customer without email" do
    customer = Customer.new
    customer.first_name = "Yunus Erdem"
    customer.last_name = "Sıhhatlı"

    assert_equal false, customer.save
  end

  test "test not save customer with email" do
    customer = Customer.new
    customer.email = "yunuserdemsihhatli@gmail.com"

    assert_equal false, customer.save
  end

  test "test not save customer with unvalid email" do
    customer = Customer.new
    customer.first_name = "Yunus Erdem"
    customer.last_name = "Sıhhatlı"
    customer.email = "yunuserdemsihhatli"

    assert_equal false, customer.save
  end

  test "test not save customer with duplicate email" do
    customer1 = Customer.new
    customer1.first_name = "Yunus Erdem"
    customer1.last_name = "Sıhhatlı"
    customer1.email = "yunuserdemsihhatli@gmail.com"

    assert_equal true, customer1.save

    customer2 = Customer.new
    customer2.first_name = "Yunus Erdem"
    customer2.last_name = "Sıhhatlı"
    customer2.email = "yunuserdemsihhatli@gmail.com"

    assert_equal false, customer2.save
  end

end
