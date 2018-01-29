require 'test_helper'

class AmefAnalysisControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @fishbone_analysis = fishbone_analyses(:one)
    @amef_analyses = amef_analyses(:one)
    sign_in employees(:admin)
  end

  test 'should show AMEF analysis' do
    get fishbone_analysis_amef_analysis_url(@fishbone_analysis, @amef_analyses)
    assert_response :success
  end

  test 'show should permit access to the correct employee' do
    sign_in employees(:one)
    get fishbone_analysis_amef_analysis_url(@fishbone_analysis, @amef_analyses)

    assert_response :success
  end

  test 'show should restrict access to a different employee' do
    sign_in employees(:two)
    get fishbone_analysis_amef_analysis_url(@fishbone_analysis, @amef_analyses)

    assert_redirected_to complaints_url
    assert_equal I18n.t(:access_restricted), flash[:alert]
  end

  test 'should get new' do
    get new_fishbone_analysis_amef_analysis_url(@fishbone_analysis)
    assert_response :success
  end

  test 'should create an AMEF analysis' do
    assert_difference('AmefAnalysis.count') do
      post fishbone_analysis_amef_analyses_url(@fishbone_analysis), params: {
        amef_analysis: { fishbone_analysis_id: @fishbone_analysis.id, amef_components_attributes: {
          '0': { fishbone_cause_id: fishbone_causes(:one).id,
                 severity: 5, frequency: 5, detectability: 5 }
        } }
      }
    end

    assert_redirected_to complaint_url(@fishbone_analysis.complaint)
  end

  test 'should not create an AMEF analysis if there are errors' do
    assert_no_difference('AmefAnalysis.count') do
      post fishbone_analysis_amef_analyses_url(@fishbone_analysis), params: {
        amef_analysis: { fishbone_analysis_id: @fishbone_analysis.id, amef_components_attributes: {
          '0': { fishbone_cause_id: fishbone_causes(:one).id,
                 severity: -5, frequency: -5, detectability: -5 }
        } }
      }
    end
    assert_response :success
  end


  test 'should destroy AMEF analysis' do
    complaint = @fishbone_analysis.complaint
    assert_difference('AmefAnalysis.count', -1) do
      delete fishbone_analysis_amef_analysis_url(@fishbone_analysis, @amef_analyses)
    end

    assert_redirected_to complaint_url(complaint)
  end
end
