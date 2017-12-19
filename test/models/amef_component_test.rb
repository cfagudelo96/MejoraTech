require 'test_helper'

class AmefComponentTest < ActiveSupport::TestCase
  setup do
    @amef_component = amef_components(:one)
  end

  test 'should belong to an AMEF analysis' do
    @amef_component.amef_analysis = nil
    assert_not @amef_component.save
  end

  test 'should belong to a fishbone category' do
    @amef_component.fishbone_category = nil
    assert_not @amef_component.save
  end

  test 'fishbone category should be unique per AMEF analysis' do
    @amef_component.fishbone_category_id =
      amef_components(:two).fishbone_category_id
    assert_not @amef_component.save
  end

  test 'severity should be greater than or equal to 1' do
    @amef_component.severity = 0
    assert_not @amef_component.save
  end

  test 'severity should be less than or equal to 10' do
    @amef_component.severity = 11
    assert_not @amef_component.save
  end

  test 'frequency should be greater than or equal to 1' do
    @amef_component.frequency = 0
    assert_not @amef_component.save
  end

  test 'frequency should be less than or equal to 10' do
    @amef_component.frequency = 11
    assert_not @amef_component.save
  end

  test 'detectability should be greater than or equal to 1' do
    @amef_component.detectability = 0
    assert_not @amef_component.save
  end

  test 'detectability should be less than or equal to 10' do
    @amef_component.detectability = 11
    assert_not @amef_component.save
  end

  test 'fishbone category should be consistent with the AMEF analysis' do
    @amef_component.fishbone_category_id = fishbone_categories(:three).id
    assert_not @amef_component.save
  end

  test 'should save' do
    amef_component = AmefComponent.new(
      amef_analysis_id: amef_analyses(:two).id,
      fishbone_category_id: fishbone_categories(:three).id,
      severity: 1,
      frequency: 10,
      detectability: 5
    )
    assert amef_component.save
  end
end
