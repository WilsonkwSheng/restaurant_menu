class Section < ApplicationRecord
  validates :label, :description, presence: true
  validates :label, uniqueness: true
end
