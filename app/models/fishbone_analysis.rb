class FishboneAnalysis < ApplicationRecord
  belongs_to :complaint

  has_many :fishbone_categories

  accepts_nested_attributes_for :fishbone_categories

  validates :effect, presence: true

  def to_s
    "Fishbone analysis for #{effect}"
  end
end
