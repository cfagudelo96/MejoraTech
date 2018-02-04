class Product < ApplicationRecord
  AVAILABLE_FILTERS = %i[name code].freeze

  filterrific(default_filter_params: { by_name: '' }, available_filters: %i[by_name by_code])

  has_many :complaints

  scope :by_name, (->(name) { where('name ilike ?', "%#{name}%") })
  scope :by_code, (->(code) { where('code ilike ?', "%#{code}%") })

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  def self.humanize_filter(filter)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{filter}")
  end

  def self.options_for_select
    Product.all.map { |e| [e.name, e.id] }
  end

  def to_s
    "#{name} (#{code})"
  end
end
