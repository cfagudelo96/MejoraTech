class AmefComponent < ApplicationRecord
  belongs_to :amef_analysis, inverse_of: :amef_components
  belongs_to :fishbone_cause

  has_one :action_plan

  validates :fishbone_cause_id, uniqueness: {
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

  def total
    severity * frequency * detectability
  end

  def percentage
    amef_total = amef_analysis.total
    ((total.to_f / amef_total.to_f) * 100).round(1)
  end
end
