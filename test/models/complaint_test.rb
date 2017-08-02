require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  test 'should not save without description' do
    complaint = Complaint.new(employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now,
                              contact_employee_id: 2,
                              code: 'Test')
    assert_not complaint.save
  end

  test 'should not save without source' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              effective_date: Time.now,
                              review_date: Time.now,
                              contact_employee_id: 2,
                              code: 'Test')
    assert_not complaint.save
  end

  test 'should not save without effective date' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              review_date: Time.now,
                              contact_employee_id: 2,
                              code: 'Test')
    assert_not complaint.save
  end

  test 'should not save without review date' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              contact_employee_id: 2,
                              code: 'Test')
    assert_not complaint.save
  end

  test 'should not save without code' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now,
                              contact_employee_id: 2)
    assert_not complaint.save
  end

  test 'contact employee should be optional' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now,
                              code: 'Test')
    assert complaint.save
  end

  test 'should save' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now,
                              contact_employee_id: 2,
                              code: 'Test')
    assert complaint.save
  end

  test 'should get product name' do
    complaint = complaints(:one)
    product = products(:one)
    assert_equal product.to_s, complaint.product_name
  end

  test 'should get a blank if there is no product name' do
    complaint = complaints(:two)
    assert_equal 'Does not apply', complaint.product_name
  end

  test 'should not raise error if the product was not found' do
    complaint = complaints(:three)
    assert_equal 'Product not found', complaint.product_name
  end

  test'assign create attributes should make the status researching' do
    complaint = complaints(:one)
    complaint.assign_create_attributes
    assert complaint.researching?
  end

  test 'assign create attributes should create a code' do
    complaint = complaints(:one)
    complaint.assign_create_attributes
    assert complaint.code.present?
  end

  test 'assign create attributes should assign the first code' do
    complaint = complaints(:one)
    complaint.assign_create_attributes
    assert complaint.code.include? "001-#{Time.now.year}"
  end

  test 'assign create attributes should assign succesive codes' do
    year = Time.now.year
    complaints(:one).update(code: "001-#{year}")
    complaint = complaints(:two)
    complaint.assign_create_attributes
    assert complaint.code.include? "002-#{year}"
  end

  test 'assign create attributes should assign a code with the Farmatech company identifier' do
    farmatech_complaint = complaints(:one)
    farmatech_complaint.assign_create_attributes
    assert farmatech_complaint.code.include? 'F'
  end

  test 'assign create attributes should assign a code with the Humax company identifier' do
    humax_complaint = complaints(:two)
    humax_complaint.assign_create_attributes
    assert humax_complaint.code.include? 'H'
  end

  test 'assign create attributes should assign a code with the Cambridge company identifier' do
    cambridge_complaint = complaints(:three)
    cambridge_complaint.assign_create_attributes
    assert cambridge_complaint.code.include? 'C'
  end

  test 'should notify redirection if the old employee id is nil' do
    complaint = complaints(:one)
    assert_difference('ActionMailer::Base.deliveries.size', +1) do
      complaint.notify_redirection(nil)
    end
  end

  test 'should not notify redirection if the employee id is the same' do
    complaint = complaints(:one)
    assert_no_difference('ActionMailer::Base.deliveries.size') do
      complaint.notify_redirection(complaint.employee_id)
    end
  end

  test 'should notify redirection if the employee id is different' do
    complaint = complaints(:one)
    assert_difference('ActionMailer::Base.deliveries.size', +1) do
      complaint.notify_redirection(complaint.employee_id + 1)
    end
  end
end
