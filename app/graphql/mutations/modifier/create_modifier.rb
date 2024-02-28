module Mutations
  module Modifier
    class CreateModifier < Mutations::BaseMutation
      argument :item_id, ID, required: true
      argument :modifier_group_id, ID, required: true
      argument :label, String, required: true
      argument :display_order, Integer, required: false
      argument :default_quantity, Integer, required: false
      argument :price_override, Float, required: false

      field :modifier, Types::Model::Modifier, null: false

      def resolve(item_id:, modifier_group_id:, **attributes)
        item = ::Item.find_by(id: item_id)
        modifier_group = ::ModifierGroup.find_by(id: modifier_group_id)

        error_message = []
        error_message << 'Item does not exist' if item.nil?
        error_message << 'ModifierGroup does not exist' if modifier_group.nil?

        raise error_message.join(', ') if error_message.present?

        modifier = item.modifiers.create!(attributes.merge(modifier_group_id: modifier_group.id))

        { modifier: modifier }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
