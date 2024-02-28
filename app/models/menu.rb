class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  validates :label, :state, :start_date, :end_date, presence: true
  validates :label, uniqueness: true
  validates :state, inclusion: { in: ['draft', 'active'], message: "%{value} is not valid" }
  validate :end_date_not_before_start_date

  private

  def end_date_not_before_start_date
    errors.add(:end_date, "can't be before start date") if end_date <= start_date
  end
end
