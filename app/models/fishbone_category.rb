class FishboneCategory < ApplicationRecord
  belongs_to :fishbone_analysis

  has_many :fishbone_causes

  accepts_nested_attributes_for :fishbone_causes

  validates :category, presence: true, uniqueness: { scope: :fishbone_analysis }

  def to_s
    category
  end
end
