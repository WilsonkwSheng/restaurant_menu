class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :label, presence: true
  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
  validates :default_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price_override, numericality: { greater_than_or_equal_to: 0 }
end
