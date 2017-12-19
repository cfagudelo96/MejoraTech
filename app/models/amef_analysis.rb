class AmefAnalysis < ApplicationRecord
  belongs_to :fishbone_analysis

  has_many :amef_components
end
