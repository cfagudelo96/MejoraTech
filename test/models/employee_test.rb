require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'should filter by name' do
    assert_equal 3, Employee.all.size
    assert_equal 2, Employee.by_name('MyString').size
  end

  test 'should filter by identification' do
    assert_equal 3, Employee.all.size
    assert_equal 1, Employee.by_identification(1).size
  end

  test 'should filter by position' do
    assert_equal 3, Employee.all.size
    assert_equal 2, Employee.by_position('MyString').size
  end
end
