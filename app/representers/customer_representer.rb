module CustomerRepresenter
  include Roar::JSON

  property :id  
  property :first_name
  property :last_name  
  property :email
  property :created_at, getter: ->(*) { I18n.localize(self.created_at, :format => '%d.%m.%Y, %H:%M') }
  property :updated_at, getter: ->(*) { I18n.localize(self.updated_at, :format => '%d.%m.%Y, %H:%M') }

end
