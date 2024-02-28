# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include Queries::Menu
    include Queries::ModifierGroup
  end
end
