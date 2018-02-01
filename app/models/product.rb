class Product < ApplicationRecord
  AVAILABLE_FILTERS = %i[name code].freeze

  has_many :complaints

  # TODO Test scopes
  scope :by_name, (->(name) { where('name ilike ?', "%#{name}%") })
  scope :by_code, (->(code) { where('code ilike ?', "%#{code}%") })

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  def self.humanize_filter(filter)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{filter}")
  end

  def to_s
    "#{name} (#{code})"
  end
end
