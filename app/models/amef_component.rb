class AmefComponent < ApplicationRecord
  belongs_to :amef_analysis
  belongs_to :fishbone_category

  validates :fishbone_category_id, uniqueness: {
    scope: :amef_analysis_id
  }
  validates :severity, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :frequency, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :detectability, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates_with AmefComponentValidator
end
