require 'test_helper'

class ActionPlanTest < ActiveSupport::TestCase
  setup do
    @action_plan = action_plans(:one)
  end

  test 'should belong to an AMEF component' do
    @action_plan.amef_component = nil
    assert_not @action_plan.save
  end

  test 'should belong to an employee' do
    @action_plan.employee = nil
    assert_not @action_plan.save
  end

  test 'should have an action plan' do
    @action_plan.action_plan = ''
    assert_not @action_plan.save
  end

  test 'should have a how' do
    @action_plan.how = ''
    assert_not @action_plan.save
  end

  test 'should have an execution date' do
    @action_plan.execution_date = ''
    assert_not @action_plan.save
  end

  test 'should have a positive cost' do
    @action_plan.cost = -1
    assert_not @action_plan.save
  end

  test 'should have an evaluation' do
    @action_plan.evaluation = ''
    assert_not @action_plan.save
  end

  test 'should have an evaluation date' do
    @action_plan.evaluation_date = ''
    assert_not @action_plan.save
  end

  test 'should save' do
    date = Time.now
    action_plan = ActionPlan.new(amef_component_id: amef_components(:one).id,
                                 employee_id: employees(:one).id,
                                 action_plan: 'Test',
                                 how: 'Test',
                                 execution_date: date,
                                 cost: 0.0,
                                 evaluation: 'Test',
                                 evaluation_date: date)
    assert action_plan.save
  end
end
