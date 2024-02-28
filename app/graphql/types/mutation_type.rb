# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::Menu::CreateMenu
    field :update_menu, mutation: Mutations::Menu::UpdateMenu
    field :destroy_menu, mutation: Mutations::Menu::DestroyMenu

    field :create_section, mutation: Mutations::Section::CreateSection
  end
end
