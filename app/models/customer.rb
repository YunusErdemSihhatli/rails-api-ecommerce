class Customer < ApplicationRecord

  has_many :addresses
  has_many :carts
  has_many :orders

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_format_of     :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

end
