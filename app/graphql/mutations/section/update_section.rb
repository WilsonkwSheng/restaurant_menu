module Mutations
  module Section
    class UpdateSection < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :menu_id, ID, required: true
      argument :label, String, required: false
      argument :description, String, required: false
      argument :display_order, Integer, required: false

      field :section, Types::Model::Section, null: false

      def resolve(id:, menu_id:, **attributes)
        menu = ::Menu.find_by(id: menu_id)
        section = menu&.sections&.find_by(id: id)

        error_message = []
        error_message << 'Menu does not exist' if menu.nil?
        error_message << 'Section does not exist' if section.nil?

        raise error_message.join(', ') if error_message.present?

        menu_section = ::MenuSection.find_by(menu: menu, section: section)
        display_order = attributes.delete(:display_order)

        menu_section_input = {
          display_order: display_order.nil? ? menu_section.display_order : display_order
        }

        section.update!(attributes)
        menu_section.update!(menu_section_input)

        { section: section }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
