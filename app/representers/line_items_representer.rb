module LineItemsRepresenter
  include Roar::JSON

  collection :to_a, extend: LineItemRepresenter, embedded: true, as: :line_items

end
