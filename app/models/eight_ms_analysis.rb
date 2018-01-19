class EightMsAnalysis < ApplicationRecord
  belongs_to :complaint

  validates :consequence, presence: true

  def to_s
    I18n.t('activerecord.models.eight_ms_analysis.to_s', consequence: consequence)
  end
end
