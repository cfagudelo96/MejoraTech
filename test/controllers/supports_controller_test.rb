require 'test_helper'

class SupportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @complaint = complaints(:one)
    @support = supports(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get complaint_supports_url(@complaint)
    assert_response :success
  end

  test 'should get new' do
    get new_complaint_support_path(@complaint)
    assert_response :success
  end

  test 'should create support' do
    assert_difference('Support.count') do
      post complaint_supports_url(@complaint), params: support_params_hash
    end

    assert_redirected_to complaint_path(@complaint)
  end

  test 'should show support' do
    get complaint_support_url(@complaint, @support)
    assert_response :success
  end

  test 'show should permit access to the correct employee' do
    sign_in employees(:one)
    get complaint_support_url(@complaint, @support)

    assert_response :success
  end

  test 'show should restrict access to a different employee' do
    sign_in employees(:two)
    get complaint_support_url(@complaint, @support)

    assert_redirected_to complaints_url
    assert_equal "You don't have permission to access the supporting info of this complaint", flash[:alert]
  end

  test 'should get edit' do
    get edit_complaint_support_url(@complaint, @support)
    assert_response :success
  end

  test 'should update support' do
    patch complaint_support_url(@complaint, @support), params: support_params_hash
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy support' do
    assert_difference('Support.count', -1) do
      delete complaint_support_url(@complaint, @support)
    end

    assert_redirected_to complaint_url(@complaint)
  end

  private

  def support_params_hash
    { support: { description: @support.description, support_file: fixture_file_upload('files/SupportFile.txt', 'text/plain') } }
  end
end
