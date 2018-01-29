require 'test_helper'

class AmefAnalysisTest < ActiveSupport::TestCase
  setup do
    @amef_analysis = amef_analyses(:one)
  end

  test 'should belong to a fishbone analysis' do
    @amef_analysis.fishbone_analysis = nil
    assert_not @amef_analysis.save
  end

  test 'should save' do
    amef_analysis = AmefAnalysis.new(
      fishbone_analysis_id: fishbone_analyses(:one).id
    )
    assert amef_analysis.save
  end

  test 'should get total' do
    assert_equal 250, @amef_analysis.total
  end
end
