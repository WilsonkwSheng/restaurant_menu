module Mutations
  module Menu
    class DestroyMenu < Mutations::BaseMutation
      argument :id, ID, required: true

      field :menu, Types::Model::Menu, null: false
  
      def resolve(id:)
        menu = ::Menu.find_by(id: id)

        raise 'Menu does not exist' if menu.nil?

        menu.destroy!

        { menu: menu }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
