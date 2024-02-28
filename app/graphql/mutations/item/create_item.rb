module Mutations
  module Item
    class CreateItem < Mutations::BaseMutation
      argument :section_id, ID, required: true
      argument :label, String, required: true
      argument :description, String, required: true
      argument :price, Float, required: false
      argument :type, Enums::ItemEnumType, required: true
      argument :display_order, Integer, required: false

      field :item, Types::Model::Item, null: false

      def resolve(section_id:, display_order: 0, **attributes)
        section = ::Section.find_by(id: section_id)

        raise 'Section does not exist' if section.nil?

        item = section.items.create!(attributes)
        section.section_items.find_by(item: item).update!(display_order: display_order)

        { item: item }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
