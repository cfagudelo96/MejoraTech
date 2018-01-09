class ActionPlan < ApplicationRecord
  belongs_to :amef_component
  belongs_to :employee

  validates :action_plan, presence: true
  validates :how, presence: true
  validates :execution_date, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :evaluation, presence: true
  validates :evaluation_date, presence: true

  def to_s
    cause = amef_component.fishbone_cause.cause
    I18n.t('activerecord.models.action_plan.to_s', cause: cause)
  end
end
