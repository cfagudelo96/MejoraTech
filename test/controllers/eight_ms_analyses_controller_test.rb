require 'test_helper'

class EightMsAnalysesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @complaint = complaints(:one)
    @eight_ms_analysis = eight_ms_analyses(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get complaint_eight_ms_analyses_url(@complaint)
    assert_response :success
  end

  test 'should get new' do
    get new_complaint_eight_ms_analysis_url(@complaint)
    assert_response :success
  end

  test 'should create eight ms analysis' do
    assert_difference('EightMsAnalysis.count') do
      post complaint_eight_ms_analyses_url(@complaint), params: { eight_ms_analysis: {
        consequence: @eight_ms_analysis.consequence,
        machines: @eight_ms_analysis.machines,
        management: @eight_ms_analysis.management,
        manpower: @eight_ms_analysis.manpower,
        materials: @eight_ms_analysis.materials,
        methods: @eight_ms_analysis.methods,
        money: @eight_ms_analysis.money,
        medium: @eight_ms_analysis.medium,
        measurements: @eight_ms_analysis.measurements
      } }
    end

    assert_redirected_to complaint_url(@complaint)
  end

  test 'should show eight ms analysis' do
    get complaint_eight_ms_analysis_url(@complaint, @eight_ms_analysis)
    assert_response :success
  end

  test 'should get edit' do
    get edit_complaint_eight_ms_analysis_url(@complaint, @eight_ms_analysis)
    assert_response :success
  end

  test 'should update eight ms analysis' do
    patch complaint_eight_ms_analysis_url(@complaint, @eight_ms_analysis), params: { eight_ms_analysis: {
      consequence: @eight_ms_analysis.consequence,
      machines: @eight_ms_analysis.machines,
      management: @eight_ms_analysis.management,
      manpower: @eight_ms_analysis.manpower,
      materials: @eight_ms_analysis.materials,
      methods: @eight_ms_analysis.methods,
      money: @eight_ms_analysis.money,
      medium: @eight_ms_analysis.medium,
      measurements: @eight_ms_analysis.measurements
    } }
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy eight ms analysis' do
    assert_difference('EightMsAnalysis.count', -1) do
      delete complaint_eight_ms_analysis_url(@complaint, @eight_ms_analysis)
    end

    assert_redirected_to complaint_url(@complaint)
  end
end
