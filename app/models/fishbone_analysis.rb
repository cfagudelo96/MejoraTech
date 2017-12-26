class FishboneAnalysis < ApplicationRecord
  belongs_to :complaint

  has_many :fishbone_categories
  has_many :amef_analyses

  validates :effect, presence: true

  def to_s
    I18n.t('activerecord.models.fishbone_analysis.to_s', effect: effect)
  end
end
