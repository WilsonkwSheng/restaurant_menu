class Section < ApplicationRecord
  has_many :menu_sections

  validates :label, :description, presence: true
  validates :label, uniqueness: true
end
