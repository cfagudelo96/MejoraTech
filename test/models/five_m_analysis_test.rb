require 'test_helper'

class FiveMAnalysisTest < ActiveSupport::TestCase
  setup do
    @five_m_analysis = five_m_analyses(:one)
  end

  test 'should belong to a complaint' do
    @five_m_analysis.complaint = nil
    assert_not @five_m_analysis.save
  end

  test 'should have a consequence' do
    @five_m_analysis.consequence = ''
    assert_not @five_m_analysis.save
  end

  test 'should save' do
    five_m_analysis = FiveMAnalysis.new(consequence: 'Test',
                                        manpower: 'Test',
                                        machines: 'Test',
                                        materials: 'Test',
                                        methods: 'methods',
                                        management: 'Test',
                                        complaint_id: complaints(:one).id)
    assert five_m_analysis.save
  end
end
