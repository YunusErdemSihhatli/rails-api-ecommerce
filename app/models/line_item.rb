class LineItem < ApplicationRecord

  belongs_to :product, foreign_key: :product_id
  belongs_to :cart, foreign_key: :cart_id

  validates_presence_of :cart_id, :product_id, :piece

  before_validation :check_negative_piece
  before_validation :check_exist, on: :create

  private

  def check_negative_piece
    if self.piece.negative?
      errors.add(:piece, :invalid)
    end
  end

  def check_exist
    line_item = LineItem.find_by(product_id: self.product_id, cart_id: self.cart_id)
    unless line_item.blank?
      errors.add(:product_id, :same_product)
    end
  end

end
