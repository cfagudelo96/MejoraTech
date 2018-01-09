json.extract! action_plan,
              :id,
              :amef_component_id,
              :action_plan,
              :how,
              :execution_date,
              :cost,
              :evaluation,
              :evaluation_date,
              :employee_id,
              :created_at,
              :updated_at
json.url amef_component_action_plan_url(action_plan.amef_component, action_plan, format: :json)
