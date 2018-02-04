class Employee < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable,
         :trackable, :validatable

  AVAILABLE_FILTERS = %i[name identification position].freeze

  filterrific(default_filter_params: { by_name: '' },
              available_filters: %i[by_name by_identification by_position])

  has_many :complaints

  scope :by_name, (->(name) { where('name ilike ?', "%#{name}%") })
  scope :by_identification, (->(identification) { where(identification: identification) })
  scope :by_position, (->(position) { where('position ilike ?', "%#{position}%") })

  def self.options_for_select
    Employee.all.map { |e| [e.name, e.id] }
  end

  def self.humanize_filter(filter)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{filter}")
  end

  def to_s
    "#{name} (C.C. #{identification})"
  end
end
