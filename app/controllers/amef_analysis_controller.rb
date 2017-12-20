class AmefAnalysisController < ApplicationController
  before_action :set_complaint
  before_action :restrict_access_to_employee

  def new

  end

  def create

  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def restrict_access_to_employee
    return if current_employee.admin || current_employee.id == @complaint.employee_id
    redirect_to complaints_path, alert: I18n.t(:access_restricted)
  end
end
