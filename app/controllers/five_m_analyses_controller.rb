class FiveMAnalysesController < ApplicationController
  before_action :set_complaint
  before_action :set_five_m_analysis, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access_to_employee

  # GET /five_m_analyses
  # GET /five_m_analyses.json
  def index
    @five_m_analyses = @complaint.five_m_analyses
  end

  # GET /five_m_analyses/1
  # GET /five_m_analyses/1.json
  def show
  end

  # GET /five_m_analyses/new
  def new
    @five_m_analysis = FiveMAnalysis.new
  end

  # GET /five_m_analyses/1/edit
  def edit
  end

  # POST /five_m_analyses
  # POST /five_m_analyses.json
  def create
    @five_m_analysis = FiveMAnalysis.new(five_m_analysis_params)
    @five_m_analysis.complaint = @complaint

    respond_to do |format|
      if @five_m_analysis.save
        format.html { redirect_to @complaint, notice: 'Five m analysis was successfully created.' }
        format.json { render :show, status: :created, location: @five_m_analysis }
      else
        format.html { render :new }
        format.json { render json: @five_m_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /five_m_analyses/1
  # PATCH/PUT /five_m_analyses/1.json
  def update
    respond_to do |format|
      if @five_m_analysis.update(five_m_analysis_params)
        format.html { redirect_to @complaint, notice: 'Five m analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @five_m_analysis }
      else
        format.html { render :edit }
        format.json { render json: @five_m_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /five_m_analyses/1
  # DELETE /five_m_analyses/1.json
  def destroy
    @five_m_analysis.destroy
    respond_to do |format|
      format.html { redirect_to @complaint, notice: 'Five m analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_five_m_analysis
    @five_m_analysis = FiveMAnalysis.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def five_m_analysis_params
    params.require(:five_m_analysis).permit(:consequence, :manpower, :machines, :materials, :methods, :management)
  end

  def restrict_access_to_employee
    unless current_employee.admin || current_employee.id == @complaint.employee_id
      redirect_to complaints_path, alert: "You don't have permission to access this five M analysis"
    end
  end
end
