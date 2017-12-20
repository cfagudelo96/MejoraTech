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
      post employees_url, params: employee_parameters
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
    patch employee_url(@employee), params: employee_parameters
    assert_redirected_to employee_url(@employee)
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end

  test 'should get edit password' do
    get edit_password_employees_url
    assert_response :success
    assert_equal employees(:admin), assigns(:employee)
  end

  private

  def employee_parameters
    { employee: {
      email: 'test@test.com',
      identification: @employee.identification,
      name: @employee.name,
      position: @employee.position
    } }
  end
end
