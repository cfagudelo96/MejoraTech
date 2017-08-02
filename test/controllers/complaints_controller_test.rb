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

  test 'index should show all complaints to an admin' do
    get complaints_url
    assert_equal Complaint.count, assigns(:complaints).size
  end

  test 'index should show the employees complaints to an employee' do
    employee = employees(:one)
    sign_in employee

    get complaints_url
    complaints = assigns(:complaints)
    assert_equal employee.complaints.size, complaints.size
    assert_not_equal Complaint.count, complaints.size
  end

  test 'should get new' do
    get new_complaint_url
    assert_response :success
  end

  test 'should create complaint' do
    assert_difference('Complaint.count') do
      post complaints_url, params: complaint_parameters_hash
    end

    assert_redirected_to complaint_url(Complaint.last)
  end

  test 'create should notify redirection' do
    assert_difference('ActionMailer::Base.deliveries.size', +1) do
      post complaints_url, params: complaint_parameters_hash
    end
    complaint_redirected_email = ActionMailer::Base.deliveries.last

    assert_equal 'New complaint investigation assigned',
                 complaint_redirected_email.subject
  end

  test 'should show complaint' do
    get complaint_url(@complaint)
    assert_response :success
  end

  test 'show should retrieve the complaint' do
    get complaint_url(@complaint)
    assert_equal @complaint, assigns(:complaint)
  end

  test 'show should permit access to the correct employee' do
    sign_in employees(:one)
    get complaint_url(@complaint)

    assert_response :success
  end

  test 'show should restrict access to a different employee' do
    sign_in employees(:two)
    get complaint_url(@complaint)

    assert_redirected_to complaints_url
    assert_equal "You don't have permission to access this complaint", flash[:alert]
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
    patch complaint_url(@complaint), params: complaint_parameters_hash
    assert_redirected_to complaint_url(@complaint)
  end

  test 'update should not notify redirection if the employee did not change' do
    assert_no_difference('ActionMailer::Base.deliveries.size') do
      patch complaint_url(@complaint), params: complaint_parameters_hash
    end
  end

  test 'update should notify redirection if the employee changed' do
    assert_difference('ActionMailer::Base.deliveries.size', +1) do
      patch complaint_url(@complaint), params: { complaint: { employee_id: @complaint.employee_id + 1 } }
    end
    complaint_redirected_email = ActionMailer::Base.deliveries.last

    assert_equal 'New complaint investigation assigned',
                 complaint_redirected_email.subject
  end

  test 'should destroy complaint' do
    assert_difference('Complaint.count', -1) do
      delete complaint_url(@complaint)
    end

    assert_redirected_to complaints_url
  end

  private

  def complaint_parameters_hash
    { complaint: { batch_number: @complaint.batch_number,
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
end
