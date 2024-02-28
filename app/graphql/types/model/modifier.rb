module Types
  module Model
    class Modifier < Types::BaseObject
      field :id, ID, null: false
      field :label, String, null: false
      field :display_order, Integer, null: false
      field :default_quantity, Integer, null: false
      field :price_override, Float, null: false
    end
  end
end
