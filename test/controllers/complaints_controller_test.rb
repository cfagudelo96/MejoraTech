require 'test_helper'

class ComplaintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint = complaints(:one)
  end

  test 'should get index' do
    get complaints_url
    assert_response :success
  end

  test 'should get new' do
    get new_complaint_url
    assert_response :success
  end

  test 'should create complaint' do
    assert_difference('Complaint.count') do
      post complaints_url, params: { complaint: { batch_number: @complaint.batch_number, classification: @complaint.classification, description: @complaint.description, effective_date: @complaint.effective_date, employee_id: @complaint.employee_id, expiration_date: @complaint.expiration_date, pending: @complaint.pending, product_id: @complaint.product_id, review_date: @complaint.review_date, source: @complaint.source } }
    end

    assert_redirected_to complaint_url(Complaint.last)
  end

  test 'should show complaint' do
    get complaint_url(@complaint)
    assert_response :success
  end

  test 'should get edit' do
    get edit_complaint_url(@complaint)
    assert_response :success
  end

  test 'should update complaint' do
    patch complaint_url(@complaint), params: { complaint: { batch_number: @complaint.batch_number, classification: @complaint.classification, description: @complaint.description, effective_date: @complaint.effective_date, employee_id: @complaint.employee_id, expiration_date: @complaint.expiration_date, pending: @complaint.pending, product_id: @complaint.product_id, review_date: @complaint.review_date, source: @complaint.source } }
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy complaint' do
    assert_difference('Complaint.count', -1) do
      delete complaint_url(@complaint)
    end

    assert_redirected_to complaints_url
  end
end
