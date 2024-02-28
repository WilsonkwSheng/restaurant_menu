module Types
  module Model
    class Section < Types::BaseObject
      field :id, ID, null: false
      field :label, String, null: false
      field :description, String, null: false
      field :display_order, Integer, null: false

      def display_order
        object.menu_sections.last.display_order
      end
    end
  end
end
