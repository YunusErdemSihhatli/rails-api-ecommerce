class Product < ApplicationRecord

  has_many :line_items

  validates_presence_of :name, :price, :stock

  validate :check_negative_stock

  def check_negative_stock
    if self.stock.negative?
      errors.add(:stock, :invalid)
    end
  end

end
