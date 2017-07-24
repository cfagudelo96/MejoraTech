require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  test 'should not save without description' do
    complaint = Complaint.new(employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now)
    assert_not complaint.save
  end

  test 'should not save without source' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              effective_date: Time.now,
                              review_date: Time.now)
    assert_not complaint.save
  end

  test 'should not save without effective date' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              review_date: Time.now)
    assert_not complaint.save
  end

  test 'should not save without review date' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now)
    assert_not complaint.save
  end

  test 'should save' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now,
                              review_date: Time.now)
    assert complaint.save
  end

  test 'should get product name' do
    complaint = complaints(:one)
    product = products(:one)
    assert_equal product.to_s, complaint.product_name
  end

  test 'should get a blank if there is no product name' do
    complaint = complaints(:two)
    assert_equal '-', complaint.product_name
  end

  test 'should not raise error if the product was not found' do
    complaint = complaints(:three)
    assert_equal 'Product not found', complaint.product_name
  end
end
