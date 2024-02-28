module Mutations
  module Menu
    class CreateMenu < Mutations::BaseMutation
      argument :label, String, required: true
      argument :state, Enums::MenuEnumType, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
      argument :end_date, GraphQL::Types::ISO8601DateTime, required: true

      field :menu, Types::Model::Menu, null: false

      def resolve(**attributes)
        menu = ::Menu.create!(attributes)

        { menu: menu }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
