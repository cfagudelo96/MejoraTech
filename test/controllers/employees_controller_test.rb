require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @employee = employees(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get employees_url
    assert_response :success
  end

  test 'should get new' do
    get new_employee_url
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post create_employee_url, params: { employee: { email: 'test@test.com', identification: @employee.identification, name: @employee.name, position: @employee.position } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test 'should show employee' do
    get employee_url(@employee)
    assert_response :success
  end

  test 'should get edit' do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@employee), params: { employee: { email: @employee.email, identification: @employee.identification, name: @employee.name, position: @employee.position } }
    assert_redirected_to employee_url(@employee)
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
