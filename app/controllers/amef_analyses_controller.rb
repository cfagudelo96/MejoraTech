class AmefAnalysesController < ApplicationController
  before_action :set_fishbone_analysis
  before_action :set_amef_analysis, only: %i[show]
  before_action :restrict_access_to_employee

  helper_method :sort_column, :sort_direction

  def show
    amef_percentage =  @amef_analysis.amef_components.sort_by(&:percentage)

    if params['all'] == "true"
      @amef_components = amef_percentage
      @all= true
    else
      @all= false
      percentage = 0
      @amef_components=[]
      amef_percentage.reverse.each do |amef_component|
        if percentage < 80
          @amef_components.push(amef_component)
          percentage += amef_component.percentage
        end
      end
    end

    if sort_column == "cause"
      @amef_components.sort!
    elsif sort_column == "severity"
      @amef_components = @amef_components.sort_by(&:severity)
    elsif sort_column == "frequency"
      @amef_components = @amef_components.sort_by(&:frequency)
    elsif sort_column == "detectability"
      @amef_components = @amef_components.sort_by(&:detectability)
    elsif sort_column == "total"
      @amef_components = @amef_components.sort_by(&:total)
    elsif sort_column == "percentage"
      @amef_components = @amef_components
    end
    if sort_direction == "desc"
      @amef_components.reverse!
    end

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


  def sortable_columns
    ["cause", "severity","frequency","detectability","total","percentage"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "cause"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
