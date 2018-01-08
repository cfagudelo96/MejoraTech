class AmefAnalysis < ApplicationRecord
  belongs_to :fishbone_analysis

  has_many :amef_components, inverse_of: :amef_analysis

  accepts_nested_attributes_for :amef_components, reject_if:
    proc { |attributes|
      no_severity = attributes[:severity].blank?
      no_frequency = attributes[:frequency].blank?
      no_detectability = attributes[:detectability].blank?
      no_severity || no_frequency || no_detectability
    }

  def total
    total = 0
    amef_components.each do |amef_component|
      total += amef_component.total
    end
    total
  end

  def to_s
    I18n.t('activerecord.models.amef_analysis.to_s', effect: fishbone_analysis.effect)
  end
end
