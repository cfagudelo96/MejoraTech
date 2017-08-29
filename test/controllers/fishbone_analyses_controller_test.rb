require 'test_helper'

class FishboneAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishbone_analysis = fishbone_analyses(:one)
  end

  test "should get index" do
    get fishbone_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_fishbone_analysis_url
    assert_response :success
  end

  test "should create fishbone_analysis" do
    assert_difference('FishboneAnalysis.count') do
      post fishbone_analyses_url, params: { fishbone_analysis: { complaint_id: @fishbone_analysis.complaint_id, effect: @fishbone_analysis.effect } }
    end

    assert_redirected_to fishbone_analysis_url(FishboneAnalysis.last)
  end

  test "should show fishbone_analysis" do
    get fishbone_analysis_url(@fishbone_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishbone_analysis_url(@fishbone_analysis)
    assert_response :success
  end

  test "should update fishbone_analysis" do
    patch fishbone_analysis_url(@fishbone_analysis), params: { fishbone_analysis: { complaint_id: @fishbone_analysis.complaint_id, effect: @fishbone_analysis.effect } }
    assert_redirected_to fishbone_analysis_url(@fishbone_analysis)
  end

  test "should destroy fishbone_analysis" do
    assert_difference('FishboneAnalysis.count', -1) do
      delete fishbone_analysis_url(@fishbone_analysis)
    end

    assert_redirected_to fishbone_analyses_url
  end
end
