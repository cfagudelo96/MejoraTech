class AmefComponentValidator < ActiveModel::Validator
  def validate(record)
    validate_consistency(record)
  end

  private

  def validate_consistency(record)
    return if record.fishbone_category.blank? || record.amef_analysis.blank?
    fishbone_analysis1 = record.amef_analysis.fishbone_analysis
    fishbone_analysis2 = record.fishbone_category.fishbone_analysis
    return if fishbone_analysis1.id == fishbone_analysis2.id
    record.errors[:fishbone_category_id] << 'Inconsistent information'
  end
end