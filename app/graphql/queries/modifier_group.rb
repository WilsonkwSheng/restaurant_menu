module Queries
  module ModifierGroup
    extend ActiveSupport::Concern

    included do
      field :modifier_group, [Types::Model::ModifierGroup], null: false do
        argument :label_eq, String, required: false
      end
    end

    def modifier_group(label_eq: nil)
      modifier_groups = ::ModifierGroup.all
      modifier_groups = modifier_groups.where('label ILIKE ?', "%#{label_eq}%") if label_eq.present?
      modifier_groups
    end
  end
end
