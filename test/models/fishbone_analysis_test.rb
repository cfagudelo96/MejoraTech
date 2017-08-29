require 'test_helper'

class FishboneAnalysisTest < ActiveSupport::TestCase
  setup do
    @fishbone_analysis = fishbone_analyses(:one)
  end

  test 'should belong to a complaint' do
    @fishbone_analysis.complaint_id = nil
    assert_not @fishbone_analysis.save
  end

  test 'should not save without an effect' do
    @fishbone_analysis.effect = ''
    assert_not @fishbone_analysis.save
  end

  test 'should save' do
    fishbone_analysis = FishboneAnalysis.new(effect: 'Test', complaint_id: complaints(:one).id)
    assert fishbone_analysis.save
  end
end
