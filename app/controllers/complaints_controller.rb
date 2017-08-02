class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access_to_admin, except: [:index, :show]
  before_action :restrict_access_to_employee, only: [:show]

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = if current_employee.admin
                    Complaint.paginate(page: params[:page])
                  else
                    current_employee.complaints
                  end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
    @complaint.review_date = 7.days.from_now
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.assign_create_attributes

    respond_to do |format|
      if @complaint.save
        @complaint.notify_redirection

        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    old_employee_id = @complaint.employee_id

    respond_to do |format|
      if @complaint.update(complaint_params)
        @complaint.notify_redirection(old_employee_id)

        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def complaint_params
    params.require(:complaint).permit(:product_id, :description, :employee_id,
                                      :classification, :source, :batch_number,
                                      :expiration_date, :effective_date, :review_date,
                                      :source_email, :source_contact_info,
                                      :contact_employee_id, :company)
  end

  def restrict_access_to_employee
    unless current_employee.admin || current_employee.id == @complaint.employee_id
      redirect_to complaints_path, alert: "You don't have permission to access this complaint"
    end
  end
end
