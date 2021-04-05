class Cart < ApplicationRecord

  has_many :line_items, foreign_key: :cart_id
  # This field would be filled later
  belongs_to :address, optional: true
  # This field would be filled later
  belongs_to :order, optional: true

  validates_presence_of :customer_id

end
