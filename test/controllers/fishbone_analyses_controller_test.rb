require 'test_helper'

class FishboneAnalysesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @complaint = complaints(:one)
    @fishbone_analysis = fishbone_analyses(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get complaint_fishbone_analyses_url(@complaint)
    assert_response :success
  end

  test 'should get new' do
    get new_complaint_fishbone_analysis_url(@complaint)
    assert_response :success
  end

  test 'should create fishbone_analysis' do
    assert_difference('FishboneAnalysis.count') do
      post complaint_fishbone_analyses_url(@complaint), params: {
        fishbone_analysis: { effect: @fishbone_analysis.effect }
      }
    end

    assert_redirected_to complaint_url(FishboneAnalysis.last.complaint)
  end

  test 'should show fishbone_analysis' do
    get complaint_fishbone_analysis_url(@complaint, @fishbone_analysis)
    assert_response :success
  end

  test 'should get edit' do
    get edit_complaint_fishbone_analysis_url(@complaint, @fishbone_analysis)
    assert_response :success
  end

  test 'should update fishbone_analysis' do
    patch complaint_fishbone_analysis_url(@complaint, @fishbone_analysis), params: {
      fishbone_analysis: { effect: @fishbone_analysis.effect }
    }
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy fishbone_analysis' do
    assert_difference('FishboneAnalysis.count', -1) do
      delete complaint_fishbone_analysis_path(@complaint, @fishbone_analysis)
    end

    assert_redirected_to complaint_url(@complaint)
  end
end
