module Mutations
  module ModifierGroup
    class CreateModifierGroup < Mutations::BaseMutation
      argument :label, String, required: true
      argument :selection_required_min, Integer, required: false
      argument :selection_required_max, Integer, required: false

      field :modifier_group, Types::Model::ModifierGroup, null: false

      def resolve(**attributes)
        modifier_group = ::ModifierGroup.create!(attributes)

        { modifier_group: modifier_group }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
