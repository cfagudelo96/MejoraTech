require 'test_helper'

class ActionPlansControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @action_plan = action_plans(:one)
    sign_in employees(:admin)
  end

  test 'should restrict the access to an appropriate employee' do
    sign_in employees(:two)
    get amef_component_action_plan_url(@action_plan.amef_component, @action_plan)
    assert_redirected_to complaints_url
    assert_equal I18n.t(:access_restricted), flash[:alert]

    sign_in employees(:one)
    get amef_component_action_plan_url(@action_plan.amef_component, @action_plan)
    assert_response :success

    sign_in employees(:admin)
    get amef_component_action_plan_url(@action_plan.amef_component, @action_plan)
    assert_response :success
  end

  test 'should show an action plan' do
    get amef_component_action_plan_url(@action_plan.amef_component, @action_plan)
    assert_response :success
  end

  test 'should get new' do
    get new_amef_component_action_plan_url(@action_plan.amef_component, @action_plan)
    assert_response :success
  end

  test 'should create an action plan' do
    amef_component = @action_plan.amef_component
    complaint = amef_component.amef_analysis.fishbone_analysis.complaint
    @action_plan.delete
    date = Time.now

    assert_difference('ActionPlan.count') do
      post amef_component_action_plans_url(amef_component), params: { action_plan: {
        employee_id: employees(:one).id,
        action_plan: 'Test',
        how: 'Test',
        execution_date: date,
        cost: 0.0,
        evaluation: 'Test',
        evaluation_date: date
      } }
    end

    assert_redirected_to complaint_url(complaint)
  end

  test 'should not create an action plan if there are errors' do
    amef_component = @action_plan.amef_component
    date = Time.now

    assert_no_difference 'ActionPlan.count' do
      post amef_component_action_plans_url(amef_component), params: { action_plan: {
        employee_id: employees(:one).id,
        action_plan: '',
        how: '',
        execution_date: date,
        cost: -1.0,
        evaluation: '',
        evaluation_date: date
      } }
    end
  end
end
