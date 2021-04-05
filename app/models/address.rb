class Address < ApplicationRecord

  belongs_to :customer
  has_many :carts

  validates_presence_of :customer_id, :first_name, :last_name, :phone, :title, :description, :city_name, :town_name

end
