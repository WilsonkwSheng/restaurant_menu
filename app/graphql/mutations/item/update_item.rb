module Mutations
  module Item
    class UpdateItem < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :section_id, ID, required: true
      argument :label, String, required: false
      argument :description, String, required: false
      argument :price, Float, required: false
      argument :type, Enums::ItemEnumType, required: false
      argument :display_order, Integer, required: false

      field :item, Types::Model::Item, null: false

      def resolve(id:, section_id:, **attributes)
        section = ::Section.find_by(id: section_id)
        item = section&.items&.find_by(id: id)

        error_message = []
        error_message << 'Section does not exist' if section.nil?
        error_message << 'Item does not exist' if item.nil?

        raise error_message.join(', ') if error_message.present?

        section_item = ::SectionItem.find_by(section: section, item: item)
        display_order = attributes.delete(:display_order)

        section_item_input = {
          display_order: display_order.nil? ? section_item.display_order : display_order
        }

        item.update!(attributes)
        section_item.update!(section_item_input)

        { item: item }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
