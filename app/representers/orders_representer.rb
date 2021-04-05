module OrdersRepresenter
  include Roar::JSON

  collection :to_a, extend: OrderRepresenter, embedded: true, as: :orders

end
