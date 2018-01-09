class AmefAnalysesController < ApplicationController
  before_action :set_fishbone_analysis
  before_action :set_amef_analysis, only: %i[show]
  before_action :restrict_access_to_employee

  def show
    @amef_components = @amef_analysis.amef_components.order(:frequency)
  end

  def new
    @amef_analysis = AmefAnalysis.new
    @amef_analysis.amef_components.build
  end

  def create
    @amef_analysis = AmefAnalysis.new(amef_analysis_params)
    respond_to do |format|
      if @amef_analysis.save
        format.html { redirect_to complaint_path(@fishbone_analysis.complaint), notice: 'Success' }
        format.json { render :show, status: :created, location: @amef_analysis }
      else
        format.html { render :new }
        format.json { render json: @amef_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def amef_analysis_params
    params[:amef_analysis][:fishbone_analysis_id] = params[:fishbone_analysis_id]
    params.require(:amef_analysis).permit(
      :fishbone_analysis_id, amef_components_attributes: %i[
        fishbone_cause_id severity frequency detectability
      ]
    )
  end

  def set_fishbone_analysis
    @fishbone_analysis = FishboneAnalysis.find(params[:fishbone_analysis_id])
  end

  def set_amef_analysis
    @amef_analysis = AmefAnalysis.find(params[:id])
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @fishbone_analysis.complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: I18n.t(:access_restricted)
  end
end
