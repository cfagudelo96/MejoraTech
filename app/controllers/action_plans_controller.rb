class ActionPlansController < ApplicationController
  before_action :set_amef_component
  before_action :set_action_plan, only: %i[show]
  before_action :restrict_access_to_employee

  def show

  end

  def new
    @action_plan = ActionPlan.new
  end

  def create
    @action_plan = ActionPlan.new(action_plan_params)
    respond_to do |format|
      if @action_plan.save
        format.html { redirect_to success_path, notice: t('.success') }
        format.json { render :show, status: :created, location: @action_plan }
      else
        format.html { render :new }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def success_path
    complaint = @amef_component.amef_analysis.fishbone_analysis.complaint
    complaint_path(complaint)
  end

  def action_plan_params
    params[:action_plan][:amef_component_id] = params[:amef_component_id]
    params.require(:action_plan).permit(:amef_component_id,
                                        :action_plan,
                                        :how,
                                        :execution_date,
                                        :cost,
                                        :evaluation,
                                        :evaluation_date,
                                        :employee_id)
  end

  def set_amef_component
    @amef_component = AmefComponent.find(params[:amef_component_id])
  end

  def set_action_plan
    @action_plan = ActionPlan.find(params[:id])
  end

  def restrict_access_to_employee
    complaint = @amef_component.amef_analysis.fishbone_analysis.complaint
    same_employee = current_employee.id == complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: I18n.t(:access_restricted)
  end
end
