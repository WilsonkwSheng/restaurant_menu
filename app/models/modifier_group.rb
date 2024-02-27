class ModifierGroup < ApplicationRecord
  has_many :modifiers

  validates :label, presence: true
  validates :label, uniqueness: true
  validates :selection_required_min, numericality: { greater_than_or_equal_to: 0 }
  validates :selection_required_max, numericality: { greater_than_or_equal_to: 0 }
  validate :selection_required_range

  private

  def selection_required_range
    return if selection_required_min.blank? && selection_required_max.blank?

    if selection_required_max.zero?
      errors.add(:selection_required_min, "must be greater than or equal to 0 when selection_required_max is 0") if selection_required_min < 0
    elsif selection_required_min > selection_required_max
      errors.add(:selection_required_min, "cannot be greater than selection_required_max")
    end
  end
end
