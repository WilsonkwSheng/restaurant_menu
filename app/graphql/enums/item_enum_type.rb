module Enums
  class ItemEnumType < Types::BaseEnum
    value Product.name, "Item is a type of Product"
    value Component.name, "Item is a type of Component"
  end
end
