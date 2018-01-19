class EightMsAnalysesController < ApplicationController
  before_action :set_complaint
  before_action :set_eight_ms_analysis, only: %i[show edit update destroy]
  before_action :restrict_access_to_employee

  def index
    @eight_ms_analyses = @complaint.eight_ms_analyses
  end

  def show
  end

  def new
    @eight_ms_analysis = EightMsAnalysis.new
  end

  def edit
  end

  def create
    @eight_ms_analysis = EightMsAnalysis.new(eight_ms_analysis_params)
    respond_to do |format|
      if @eight_ms_analysis.save
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :created, location: @eight_ms_analysis }
      else
        format.html { render :new }
        format.json { render json: @eight_ms_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @eight_ms_analysis.update(eight_ms_analysis_params)
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :ok, location: @eight_ms_analysis }
      else
        format.html { render :edit }
        format.json { render json: @eight_ms_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @eight_ms_analysis.destroy
    respond_to do |format|
      format.html { redirect_to @complaint, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def set_eight_ms_analysis
    @eight_ms_analysis = EightMsAnalysis.find(params[:id])
  end

  def eight_ms_analysis_params
    params[:eight_ms_analysis][:complaint_id] = params[:complaint_id]
    params.require(:eight_ms_analysis).permit(:complaint_id, :consequence,
                                              :manpower, :machines,
                                              :materials, :methods,
                                              :management, :money,
                                              :medium, :measurements)
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: t(:access_restricted)
  end
end
