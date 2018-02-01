class ComplaintsController < ApplicationController
  before_action :set_complaint, only: %i[show edit update destroy extend_date]
  before_action :restrict_access_to_admin, except: %i[index show]
  before_action :restrict_access_to_employee, only: %i[show]

  def index
    @complaints = if current_employee.admin
                    Complaint.paginate(page: params[:page])
                  else
                    current_employee.complaints
                  end
  end

  def show
  end

  def new
    @complaint = Complaint.new
    @complaint.review_date = 7.days.from_now
  end

  def edit
  end

  def create
    @complaint = Complaint.new(complaint_params)
    respond_to do |format|
      if @complaint.create_and_notify
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @complaint.update_and_notify(complaint_params)
        format.html { redirect_to @complaint, notice: t('.success') }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  def extend_date
    @complaint.update(review_date: Time.now + 3.days, extended_count: @complaint.extended_count + 1)
    redirect_to complaints_path
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:product_id, :description, :employee_id,
                                      :classification, :source, :batch_number,
                                      :expiration_date, :effective_date,
                                      :review_date, :source_email,
                                      :source_contact_info,
                                      :contact_employee_id, :company, :extended_count)
  end

  def restrict_access_to_employee
    same_employee = current_employee.id == @complaint.employee_id
    return if current_employee.admin || same_employee
    redirect_to complaints_path, alert: I18n.t(:access_restricted)
  end
end
