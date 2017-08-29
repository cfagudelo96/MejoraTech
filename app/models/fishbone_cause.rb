class FishboneCause < ApplicationRecord
  belongs_to :fishbone_category

  validates :cause, presence: true

  def to_s
    cause
  end
end
