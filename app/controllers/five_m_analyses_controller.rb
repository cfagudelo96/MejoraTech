class FiveMAnalysesController < ApplicationController
  before_action :set_complaint
  before_action :set_five_m_analysis, only: %i[show edit update destroy]
  before_action :restrict_access_to_employee

  def index
    @five_m_analyses = @complaint.five_m_analyses
  end

  def show
  end

  def new
    @five_m_analysis = FiveMAnalysis.new
  end

  def edit
  end

  def create
    @five_m_analysis = FiveMAnalysis.new(five_m_analysis_params)
    respond_to do |format|
      if @five_m_analysis.save
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :created, location: @five_m_analysis }
      else
        format.html { render :new }
        format.json { render json: @five_m_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @five_m_analysis.update(five_m_analysis_params)
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :ok, location: @five_m_analysis }
      else
        format.html { render :edit }
        format.json { render json: @five_m_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @five_m_analysis.destroy
    respond_to do |format|
      format.html { redirect_to @complaint, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def set_five_m_analysis
    @five_m_analysis = FiveMAnalysis.find(params[:id])
  end

  def five_m_analysis_params
    params[:five_m_analysis][:complaint_id] = params[:complaint_id]
    params.require(:five_m_analysis).permit(:complaint_id,
                                            :consequence,
                                            :manpower,
                                            :machines,
                                            :materials,
                                            :methods,
                                            :management)
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: t(:access_restricted)
  end
end
