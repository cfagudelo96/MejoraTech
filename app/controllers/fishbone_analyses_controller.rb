class FishboneAnalysesController < ApplicationController
  before_action :set_complaint
  before_action :set_fishbone_analysis, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access_to_employee

  # GET /fishbone_analyses
  # GET /fishbone_analyses.json
  def index
    @fishbone_analyses = @complaint.fishbone_analyses
  end

  # GET /fishbone_analyses/1
  # GET /fishbone_analyses/1.json
  def show
  end

  # GET /fishbone_analyses/new
  def new
    @fishbone_analysis = @complaint.fishbone_analyses.new
    fishbone_category = @fishbone_analysis.fishbone_categories.build
    fishbone_category.fishbone_causes.build
  end

  # GET /fishbone_analyses/1/edit
  def edit
  end

  # POST /fishbone_analyses
  # POST /fishbone_analyses.json
  def create
    @fishbone_analysis = FishboneAnalysis.new(fishbone_analysis_params)
    @fishbone_analysis.complaint = @complaint

    respond_to do |format|
      if @fishbone_analysis.save
        format.html { redirect_to complaint_path(@complaint), notice: 'Fishbone analysis was successfully created.' }
        format.json { render :show, status: :created, location: @fishbone_analysis }
      else
        format.html { render :new }
        format.json { render json: @fishbone_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishbone_analyses/1
  # PATCH/PUT /fishbone_analyses/1.json
  def update
    respond_to do |format|
      if @fishbone_analysis.update(fishbone_analysis_params)
        format.html { redirect_to complaint_path(@complaint), notice: 'Fishbone analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @fishbone_analysis }
      else
        format.html { render :edit }
        format.json { render json: @fishbone_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fishbone_analyses/1
  # DELETE /fishbone_analyses/1.json
  def destroy
    @fishbone_analysis.destroy
    respond_to do |format|
      format.html { redirect_to complaint_url(@complaint), notice: 'Fishbone analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_fishbone_analysis
    @fishbone_analysis = FishboneAnalysis.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fishbone_analysis_params
    params.require(:fishbone_analysis).permit(:complaint_id, :effect, fishbone_categories_attributes: [:id, :category, fishbone_causes_attributes: [:id, :cause]])
  end

  def restrict_access_to_employee
    unless current_employee.admin || current_employee.id == @complaint.employee_id
      redirect_to complaints_path, alert: "You don't have permission to access the supporting info of this complaint"
    end
  end
end
