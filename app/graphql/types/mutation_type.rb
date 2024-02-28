# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::Menu::CreateMenu
  end
end
