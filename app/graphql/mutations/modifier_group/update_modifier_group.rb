module Mutations
  module ModifierGroup
    class UpdateModifierGroup < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :label, String, required: false
      argument :selection_required_min, Integer, required: false
      argument :selection_required_max, Integer, required: false

      field :modifier_group, Types::Model::ModifierGroup, null: false

      def resolve(id:, **attributes)
        modifier_group = ::ModifierGroup.find_by(id: id)

        raise 'ModifierGroup does not exist' if modifier_group.nil?

        modifier_group.update!(attributes)

        { modifier_group: modifier_group }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
