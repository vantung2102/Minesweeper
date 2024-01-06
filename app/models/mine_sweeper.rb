class MineSweeper < ApplicationRecord
  validate :validate_num_bombs_less_than_total_cells
  validates :name, :width, :height, :mines, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def validate_num_bombs_less_than_total_cells
    return if mines.present? && (mines < (width * height))

    errors.add(:mines, 'must be less than the total number of cells (width * height)')
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['name']
  end
end
