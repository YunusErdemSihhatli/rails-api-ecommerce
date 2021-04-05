module AddressesRepresenter
  include Roar::JSON

  collection :to_a, extend: AddressRepresenter, embedded: true, as: :addresses

end
