module OrderRepresenter
  include Roar::JSON
  
  property :id  
  property :number  
  property :state  
  property :total_price  
  property :address  
  property :products
  property :customer, getter: ->(*) { self.customer }, extend: CustomerRepresenter
  property :created_at, getter: ->(*) { I18n.localize(self.created_at, :format => '%d.%m.%Y, %H:%M') }
  property :updated_at, getter: ->(*) { I18n.localize(self.updated_at, :format => '%d.%m.%Y, %H:%M') }

end
