class Order < ApplicationRecord

  serialize :address, JSON
  serialize :products, JSON

  belongs_to :cart
  belongs_to :customer

  validates_presence_of :number, :state, :total_price, :address, :products, :customer_id, :cart_id

  enum state: { pending: 1, approved: 2, shipping: 3, delivered: 4, completed: 5, cancelled: 6, declined: 7 }

  before_validation :set_order_attributes
  after_save :set_order_id_to_cart

  private

  def set_order_attributes
    total_price = 0
    products_json = []
    if self.cart.blank?
      errors.add(:cart, :empty_cart)
    else
      self.cart.line_items.each do |line_item|
        if line_item.product.stock < line_item.piece
          errors.add(:stock, :insufficient)
        end
        product = line_item.product
        total_price = total_price + (line_item.piece * product.price)
        products_json << { "id": product.id, "name": product.name, "piece": line_item.piece, "price": product.price }
      end
      if self.cart.address.blank?
        errors.add(:cart, :empty_address)
      else
        self.address = JSON.parse(self.cart.address.to_json)
      end
    end
    self.number = "YES" + SecureRandom.alphanumeric(7).upcase
    self.total_price = total_price
    self.products = products_json
  end

  def set_order_id_to_cart
    # order_id = self.id
    self.cart.update(order_id: self.id)
  end

end
