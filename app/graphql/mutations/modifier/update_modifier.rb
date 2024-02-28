module Mutations
  module Modifier
    class UpdateModifier < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :label, String, required: false
      argument :display_order, Integer, required: false
      argument :default_quantity, Integer, required: false
      argument :price_override, Float, required: false

      field :modifier, Types::Model::Modifier, null: false

      def resolve(id:, **attributes)
        modifier = ::Modifier.find_by(id: id)

        raise 'Modifier does not exist' if modifier.nil?

        modifier.update!(attributes)

        { modifier: modifier }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
