class Product < ApplicationRecord
  AVAILABLE_FILTERS = %i[name code].freeze

  has_many :complaints

  # TODO Test scopes
  scope :by_name, (->(name) { where('name ilike ?', "%#{name}%") })
  scope :by_code, (->(code) { where('code ilike ?', "%#{code}%") })

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  def self.humanize_filter(filter)
    if filter == :name
      I18n.t('activerecord.attributes.product.name')
    elsif filter == :code
      I18n.t('activerecord.attributes.product.code')
    end
  end

  def to_s
    "#{name} (#{code})"
  end
end
