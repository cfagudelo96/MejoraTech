require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test 'should not save without description' do
    attributes = complaint_attributes
    attributes[:description] = ''
    complaint = Complaint.new(attributes)
    assert_not complaint.save
  end

  test 'should not save without source' do
    attributes = complaint_attributes
    attributes[:source] = ''
    complaint = Complaint.new(attributes)
    assert_not complaint.save
  end

  test 'should not save without effective date' do
    attributes = complaint_attributes
    attributes[:effective_date] = nil
    complaint = Complaint.new(attributes)
    assert_not complaint.save
  end

  test 'should not save without review date' do
    attributes = complaint_attributes
    attributes[:review_date] = nil
    complaint = Complaint.new(attributes)
    assert_not complaint.save
  end

  test 'should not save without code' do
    attributes = complaint_attributes
    attributes[:code] = ''
    complaint = Complaint.new(attributes)
    assert_not complaint.save
  end

  test 'contact employee should be optional' do
    attributes = complaint_attributes
    attributes[:contact_employee_id] = nil
    complaint = Complaint.new(attributes)
    assert complaint.save
  end

  test 'should save' do
    complaint = Complaint.new(complaint_attributes)
    assert complaint.save
  end

  test 'should filter by product' do
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.by_product(1).size
  end

  test 'should filter by employee' do
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.by_employee(1).size
  end

  test 'should filter by classification' do
    assert_equal 3, Complaint.all.size
    assert_equal 2, Complaint.by_classification(1).size
  end

  test 'should filter by review date greater than' do
    date = Date.new(2017, 2, 2)
    assert_equal 3, Complaint.all.size
    assert_equal 2, Complaint.review_date_gte(date).size
  end

  test 'should filter by review date less than' do
    date = Date.new(2017, 2, 2)
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.review_date_lt(date).size
  end

  test 'should filter by effective date greater than' do
    date = Date.new(2017, 2, 2)
    assert_equal 3, Complaint.all.size
    assert_equal 2, Complaint.effective_date_gte(date).size
  end

  test 'should filter by effective date less than' do
    date = Date.new(2017, 2, 2)
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.effective_date_lt(date).size
  end

  test 'should filter by company' do
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.by_company(1).size
  end

  test 'should filter by status' do
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.by_status(Complaint.statuses[:closed]).size
  end

  test 'should filter by source' do
    assert_equal 3, Complaint.all.size
    assert_equal 1, Complaint.by_source('1').size
  end

  test 'should filter by batch number' do
    assert_equal 3, Complaint.all.size
    assert_equal 2, Complaint.by_batch_number('MyString').size
  end

  test 'should get classifications for select' do
    assert_equal 6, Complaint.classifications_for_select.size
  end

  test 'should get companies for select' do
    assert_equal 3, Complaint.companies_for_select.size
  end

  test 'should get statuses for select' do
    assert_equal 3, Complaint.statuses_for_select.size
  end

  test 'should get product name' do
    complaint = complaints(:one)
    product = products(:one)
    assert_equal product.to_s, complaint.product_name
  end

  test 'should get a blank if there is no product name' do
    complaint = complaints(:two)
    assert_equal I18n.t(:does_not_apply), complaint.product_name
  end

  test 'should not raise error if the product was not found' do
    complaint = complaints(:three)
    assert_equal I18n.t(:entity_not_found, entity: Product.model_name.human), complaint.product_name
  end

  test'assign create attributes should make the status open' do
    complaint = complaints(:one)
    complaint.assign_create_attributes
    assert complaint.open?
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
    assert_enqueued_jobs 1 do
      complaint.notify_redirection(nil)
    end
  end

  test 'should not notify redirection if the employee id is the same' do
    complaint = complaints(:one)
    assert_enqueued_jobs 0 do
      complaint.notify_redirection(complaint.employee_id)
    end
  end

  test 'should notify redirection if the employee id is different' do
    complaint = complaints(:one)
    assert_enqueued_jobs 1 do
      complaint.notify_redirection(complaint.employee_id + 1)
    end
  end

  test 'should change the code if the company changed' do
    assert complaints(:one).update_and_notify(company: Complaint.companies[:humax])
    assert_equal '001-2017-H', complaints(:one).code
    assert complaints(:two).update_and_notify(company: Complaint.companies[:cambridge])
    assert_equal '002-2017-C', complaints(:two).code
    assert complaints(:three).update_and_notify(company: Complaint.companies[:farmatech])
    assert_equal '003-2017-F', complaints(:three).code
  end

  test 'should not change the code if the company did not change' do
    old_code = complaints(:one).code
    assert complaints(:one).update_and_notify(company: Complaint.companies[:farmatech])
    assert_equal old_code, complaints(:one).code
  end

  private

  def complaint_attributes
    { description: 'Test', employee_id: 1, classification: 1, source: 'Test',
      effective_date: Time.now, review_date: Time.now, contact_employee_id: 2,
      code: 'Test' }
  end
end
