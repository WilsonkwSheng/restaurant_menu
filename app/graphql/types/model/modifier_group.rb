module Types
  module Model
    class ModifierGroup < Types::BaseObject
      field :id, ID, null: false
      field :label, String, null: false
      field :selection_required_min, Integer, null: false
      field :selection_required_max, Integer, null: false
    end
  end
end
