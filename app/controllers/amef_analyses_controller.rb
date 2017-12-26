class AmefAnalysesController < ApplicationController
  before_action :set_fishbone_analysis
  before_action :restrict_access_to_employee

  def new
    @amef_analysis = AmefAnalysis.new
  end

  def create

  end

  private

  def amef_analysis_params
    params[:amef_analyses][:fishbone_analysis_id] = params[:fishbone_analysis_id]
    params.require(:amef_analyses).permit(
      :fishbone_analysis_id, amef_components: %i[
        id fishbone_cause_id severity frequency detectability
      ]
    )
  end

  def set_fishbone_analysis
    @fishbone_analysis = FishboneAnalysis.find(params[:fishbone_analysis_id])
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @fishbone_analysis.complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: I18n.t(:access_restricted)
  end
end
