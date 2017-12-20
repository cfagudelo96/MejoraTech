class FishboneAnalysesController < ApplicationController
  before_action :set_complaint
  before_action :set_fishbone_analysis, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access_to_employee

  def index
    @fishbone_analyses = @complaint.fishbone_analyses
  end

  def show
    to_json_hash = { include: {
      fishbone_categories: { include: :fishbone_causes }
    } }
    @fishbone_analysis_json = @fishbone_analysis.to_json(to_json_hash)
  end

  def new
    @fishbone_analysis = @complaint.fishbone_analyses.new
    fishbone_category = @fishbone_analysis.fishbone_categories.build
    fishbone_category.fishbone_causes.build
  end

  def edit
  end

  def create
    @fishbone_analysis = FishboneAnalysis.new(fishbone_analysis_params)
    respond_to do |format|
      if @fishbone_analysis.save
        format.html { redirect_to complaint_path(@complaint), notice: t('.success') }
        format.json { render :show, status: :created, location: @fishbone_analysis }
      else
        format.html { render :new }
        format.json { render json: @fishbone_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fishbone_analysis.update(fishbone_analysis_params)
        format.html { redirect_to complaint_path(@complaint), notice: t('.success') }
        format.json { render :show, status: :ok, location: @fishbone_analysis }
      else
        format.html { render :edit }
        format.json { render json: @fishbone_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fishbone_analysis.destroy
    respond_to do |format|
      format.html { redirect_to complaint_url(@complaint), notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def set_fishbone_analysis
    @fishbone_analysis = FishboneAnalysis.find(params[:id])
  end

  def fishbone_analysis_params
    params[:fishbone_analysis][:complaint_id] = params[:complaint_id]
    params.require(:fishbone_analysis).permit(
      :complaint_id,
      :effect,
      fishbone_categories_attributes:
        [:id,
         :category,
         fishbone_causes_attributes: %i[id cause]]
    )
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: t(:access_restricted)
  end
end
