# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::Menu::CreateMenu
    field :update_menu, mutation: Mutations::Menu::UpdateMenu
    field :destroy_menu, mutation: Mutations::Menu::DestroyMenu

    field :create_section, mutation: Mutations::Section::CreateSection
    field :update_section, mutation: Mutations::Section::UpdateSection

    field :create_item, mutation: Mutations::Item::CreateItem
    field :update_item, mutation: Mutations::Item::UpdateItem

    field :create_modifier, mutation: Mutations::Modifier::CreateModifier
    field :update_modifier, mutation: Mutations::Modifier::UpdateModifier

    field :create_modifier_group, mutation: Mutations::ModifierGroup::CreateModifierGroup
    field :update_modifier_group, mutation: Mutations::ModifierGroup::UpdateModifierGroup
  end
end
