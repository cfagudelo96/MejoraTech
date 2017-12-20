class SupportsController < ApplicationController
  before_action :set_complaint
  before_action :set_support, only: %i[show edit update destroy]
  before_action :restrict_access_to_employee

  def index
    @supports = @complaint.supports
  end

  def show
  end

  def new
    @support = Support.new
  end

  def edit
  end

  def create
    @support = Support.new(support_params)
    respond_to do |format|
      if @support.save
        format.html { redirect_to complaint_path(@complaint), notice: t('.success') }
        format.json { render :show, status: :created, location: @support }
      else
        format.html { render :new }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to complaint_path(@complaint), notice: t('.success') }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to complaint_path(@complaint), notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def set_support
    @support = Support.find(params[:id])
  end

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def support_params
    params[:support][:complaint_id] = params[:complaint_id]
    params.require(:support).permit(:complaint_id, :support_file, :description)
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: t(:access_restricted)
  end
end
