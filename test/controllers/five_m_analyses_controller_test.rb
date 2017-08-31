require 'test_helper'

class FiveMAnalysesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @complaint = complaints(:one)
    @five_m_analysis = five_m_analyses(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get complaint_five_m_analyses_url(@complaint)
    assert_response :success
  end

  test 'should get new' do
    get new_complaint_five_m_analysis_url(@complaint)
    assert_response :success
  end

  test 'should create five_m_analysis' do
    assert_difference('FiveMAnalysis.count') do
      post complaint_five_m_analyses_url(@complaint), params: { five_m_analysis: { consequence: @five_m_analysis.consequence, machines: @five_m_analysis.machines, management: @five_m_analysis.management, manpower: @five_m_analysis.manpower, materials: @five_m_analysis.materials, methods: @five_m_analysis.methods } }
    end

    assert_redirected_to complaint_url(@complaint)
  end

  test 'should show five_m_analysis' do
    get complaint_five_m_analysis_url(@complaint, @five_m_analysis)
    assert_response :success
  end

  test 'should get edit' do
    get edit_complaint_five_m_analysis_path(@complaint, @five_m_analysis)
    assert_response :success
  end

  test 'should update five_m_analysis' do
    patch complaint_five_m_analysis_url(@complaint, @five_m_analysis), params: { five_m_analysis: { consequence: @five_m_analysis.consequence, machines: @five_m_analysis.machines, management: @five_m_analysis.management, manpower: @five_m_analysis.manpower, materials: @five_m_analysis.materials, methods: @five_m_analysis.methods } }
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy five_m_analysis' do
    assert_difference('FiveMAnalysis.count', -1) do
      delete complaint_five_m_analysis_url(@complaint, @five_m_analysis)
    end

    assert_redirected_to complaint_url(@complaint)
  end
end
