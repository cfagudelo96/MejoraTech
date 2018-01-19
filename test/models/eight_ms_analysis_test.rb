require 'test_helper'

class EightMsAnalysisTest < ActiveSupport::TestCase
  setup do
    @eight_ms_analysis = eight_ms_analyses(:one)
  end

  test 'should belong to a complaint' do
    @eight_ms_analysis.complaint = nil
    assert_not @eight_ms_analysis.save
  end

  test 'should have a consequence' do
    @eight_ms_analysis.consequence = ''
    assert_not @eight_ms_analysis.save
  end

  test 'should save' do
    eight_ms_analysis = EightMsAnalysis.new(consequence: 'Test',
                                            manpower: 'Test',
                                            machines: 'Test',
                                            materials: 'Test',
                                            methods: 'methods',
                                            management: 'Test',
                                            money: 'Test',
                                            medium: 'Test',
                                            measurements: 'Test',
                                            complaint_id: complaints(:one).id)
    assert eight_ms_analysis.save
  end
end
