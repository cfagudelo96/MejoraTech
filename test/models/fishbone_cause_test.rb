require 'test_helper'

class FishboneCauseTest < ActiveSupport::TestCase
  setup do
    @fishbone_cause = fishbone_causes(:one)
  end

  test 'should belong to a fishbone category' do
    @fishbone_cause.fishbone_category_id = nil
    assert_not @fishbone_cause.save
  end

  test 'should not save without a cause' do
    @fishbone_cause.cause = ''
    assert_not @fishbone_cause.save
  end

  test 'should save' do
    fishbone_cause = FishboneCause.new(cause: 'Test',
                                       fishbone_category_id: fishbone_categories(:one).id)
    assert fishbone_cause.save
  end
end
