class AmefAnalysesController < ApplicationController
  before_action :set_fishbone_analysis
  before_action :set_amef_analysis, only: %i[show edit destroy]
  before_action :restrict_access_to_employee

  helper_method :sort_column, :sort_direction

  def show
    @amef_components = @amef_analysis.amef_components.sort_by(&:percentage).reverse
    show_pareto_amef_components unless params[:all]
    sort_elements
  end

  def new
    @amef_analysis = AmefAnalysis.new
    @amef_analysis.amef_components.build
  end

  def create
    @amef_analysis = AmefAnalysis.new(amef_analysis_params)
    respond_to do |format|
      if @amef_analysis.save
        format.html { redirect_to complaint_path(@fishbone_analysis.complaint), notice: t('.success') }
        format.json { render :show, status: :created, location: @amef_analysis }
      else
        format.html { render :new }
        format.json { render json: @amef_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    complaint = @amef_analysis.fishbone_analysis.complaint
    @amef_analysis.destroy
    respond_to do |format|
      format.html { redirect_to complaint_path(complaint), notice: t('.success') }
      format.json { head :no_content }
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

  def show_pareto_amef_components
    sorted_amef_components = @amef_components
    @amef_components = []
    percentage = 0
    sorted_amef_components.each do |amef_component|
      break if percentage >= 80
      @amef_components << amef_component
      percentage += amef_component.percentage
    end
  end

  def sort_elements
    sorting_by = sort_column
    @amef_components = @amef_components.sort_by(&:"#{sorting_by}")
    @amef_components.reverse! if sort_direction == 'desc'
  end

  def sortable_columns
    %w[severity frequency detectability total percentage]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'percentage'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
