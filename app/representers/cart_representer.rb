module CartRepresenter
  include Roar::JSON
  
  property :id
  property :customer_id
  property :order_id
  property :line_items, getter: ->(*) { self.line_items }, extend: LineItemsRepresenter
  property :address, getter: ->(*) { self.address }, extend: AddressRepresenter

end
