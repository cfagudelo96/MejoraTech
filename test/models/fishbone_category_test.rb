require 'test_helper'

class FishboneCategoryTest < ActiveSupport::TestCase
  setup do
    @fishbone_category = fishbone_categories(:one)
  end

  test 'should belong to a fishbone analysis' do
    @fishbone_category.fishbone_analysis_id = nil
    assert_not @fishbone_category.save
  end

  test 'should not save without a category' do
    @fishbone_category.category = ''
    assert_not @fishbone_category.save
  end

  test 'should not save without being unique' do
    fishbone_category = FishboneCategory.new(category: @fishbone_category.category,
                                             fishbone_analysis_id: fishbone_analyses(:one).id)
    assert_not fishbone_category.save
  end

  test 'should save' do
    fishbone_category = FishboneCategory.new(category: @fishbone_category.category + 'Test',
                                             fishbone_analysis_id: fishbone_analyses(:one).id)
    assert fishbone_category.save
  end
end
