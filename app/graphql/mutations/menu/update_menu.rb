module Mutations
  module Menu
    class UpdateMenu < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :label, String, required: false
      argument :state, Enums::MenuEnumType, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :end_date, GraphQL::Types::ISO8601DateTime, required: false

      field :menu, Types::Model::Menu, null: false
  
      def resolve(id:, **attributes)
        menu = ::Menu.find_by(id: id)

        raise 'Menu does not exist' if menu.nil?

        menu.update!(attributes)

        { menu: menu }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
