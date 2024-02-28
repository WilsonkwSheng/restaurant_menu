module Mutations
  module Section
    class CreateSection < Mutations::BaseMutation
      argument :menu_id, ID, required: true
      argument :label, String, required: true
      argument :description, String, required: true
      argument :display_order, Integer, required: false

      field :section, Types::Model::Section, null: false

      def resolve(display_order: 0, **attributes)
        menu_id = attributes.delete(:menu_id)
        menu = ::Menu.find_by(id: menu_id)

        raise 'Menu does not exist' if menu.nil?

        section = ::Section.create!(attributes)
        section.menu_sections.create!(menu_id: menu_id, display_order: display_order)

        { section: section }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
