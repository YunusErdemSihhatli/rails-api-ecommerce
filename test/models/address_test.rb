require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @customer = customers(:one)
  end

  test "test save address" do
    address = Address.new
    address.customer_id = @customer.id
    address.first_name = "Yunus Erdem"
    address.last_name = "Sıhhatlı"
    address.phone = "(530) 123 45 67"
    address.title = "Ev"
    address.description = "Deneme Mahalle, Deneme Sokak, No: 1, D: 1, Deneme / Deneme"
    address.city_name = "Deneme"
    address.town_name = "Deneme"
    assert_equal true, address.save
  end

  test "test not save address" do
    address = Address.new
    assert_equal false, address.save
  end

end
