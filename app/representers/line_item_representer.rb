module LineItemRepresenter
  include Roar::JSON

  property :id
  property :product, getter: ->(*) { self.product }, extend: ProductRepresenter
  property :piece

end
