require 'test_helper'

class ComplaintsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @complaint = complaints(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get complaints_url
    assert_response :success
  end

  test 'index should retrieve complaints' do
    get complaints_url
    assert_not_nil assigns(:complaints)
  end

  test 'should get new' do
    get new_complaint_url
    assert_response :success
  end

  test 'should create complaint' do
    assert_difference('Complaint.count') do
      post complaints_url, params: { complaint: { batch_number: @complaint.batch_number,
                                                  classification: @complaint.classification,
                                                  description: @complaint.description,
                                                  effective_date: @complaint.effective_date,
                                                  employee_id: @complaint.employee_id,
                                                  expiration_date: @complaint.expiration_date,
                                                  product_id: @complaint.product_id,
                                                  review_date: @complaint.review_date,
                                                  source: @complaint.source,
                                                  source_email: @complaint.source_email,
                                                  source_contact_info: @complaint.source_contact_info,
                                                  contact_employee_id: @complaint.contact_employee_id,
                                                  company: @complaint.company } }
    end

    assert_redirected_to complaint_url(Complaint.last)
  end

  test 'should show complaint' do
    get complaint_url(@complaint)
    assert_response :success
  end

  test 'show should retrieve the complaint' do
    get complaint_url(@complaint)
    assert_equal @complaint, assigns(:complaint)
  end

  test 'should get edit' do
    get edit_complaint_url(@complaint)
    assert_response :success
  end

  test 'edit should retrieve the complaint' do
    get edit_complaint_url(@complaint)
    assert_equal @complaint, assigns(:complaint)
  end

  test 'should update complaint' do
    patch complaint_url(@complaint), params: { complaint: { batch_number: @complaint.batch_number,
                                                            classification: @complaint.classification,
                                                            description: @complaint.description,
                                                            effective_date: @complaint.effective_date,
                                                            employee_id: @complaint.employee_id,
                                                            expiration_date: @complaint.expiration_date,
                                                            product_id: @complaint.product_id,
                                                            review_date: @complaint.review_date,
                                                            source: @complaint.source,
                                                            source_email: @complaint.source_email,
                                                            source_contact_info: @complaint.source_contact_info,
                                                            contact_employee_id: @complaint.contact_employee_id,
                                                            company: @complaint.company } }
    assert_redirected_to complaint_url(@complaint)
  end

  test 'should destroy complaint' do
    assert_difference('Complaint.count', -1) do
      delete complaint_url(@complaint)
    end

    assert_redirected_to complaints_url
  end
end
