module Types
  module Model
    class Item < Types::BaseObject
      field :id, ID, null: false
      field :label, String, null: false
      field :description, String, null: false
      field :price, Float, null: false
      field :type, String, null: true
      field :display_order, Integer, null: true
      field :modifiers, [Types::Model::Modifier], null: true

      def display_order
        object.section_items.last.display_order
      end
    end
  end
end
