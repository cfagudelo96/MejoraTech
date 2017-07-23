require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  test 'should not save without description' do
    complaint = Complaint.new(employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now)
    assert_not complaint.save
  end

  test 'should not save without source' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              effective_date: Time.now)
    assert_not complaint.save
  end

  test 'should not save without effective date' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test')
    assert_not complaint.save
  end

  test 'should save' do
    complaint = Complaint.new(description: 'Test',
                              employee_id: 1,
                              classification: 1,
                              source: 'Test',
                              effective_date: Time.now)
    assert complaint.save
  end
end
