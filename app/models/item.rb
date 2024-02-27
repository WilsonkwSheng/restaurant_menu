class Item < ApplicationRecord
  has_many :section_items

  validates :label, :description, :type, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
