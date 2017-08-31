class FiveMAnalysis < ApplicationRecord
  belongs_to :complaint

  validates :consequence, presence: true

  def to_s
    "Five M analysis for #{consequence}"
  end
end
