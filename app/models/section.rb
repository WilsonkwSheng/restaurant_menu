class Section < ApplicationRecord
  has_many :menu_sections
  has_many :section_items
  has_many :items, through: :section_items

  validates :label, :description, presence: true
  validates :label, uniqueness: true
end
