class ModifierGroup < ApplicationRecord
  validates :label, presence: true
  validates :label, uniqueness: true
  validates :selection_required_min, numericality: { greater_than_or_equal_to: 0 }
  validates :selection_required_max, numericality: { greater_than_or_equal_to: 0 }
  validate :selection_required_min_not_greater_than_max

  private

  def selection_required_min_not_greater_than_max
    return if selection_required_min.blank? && selection_required_max.blank?

    if selection_required_min > selection_required_max
      errors.add(:selection_required_min, "cannot be greater than selection_required_max")
    end
  end
end
