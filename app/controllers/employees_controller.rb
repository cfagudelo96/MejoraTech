class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access_to_admin, except: [:edit_password, :update_password]

  def index
    @employees = Employee.paginate(page: params[:page])
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params_with_password)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: t('.success') }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: t('.success') }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  def edit_password
    @employee = current_employee
  end

  def update_password
    @employee = current_employee
    if @employee.update_with_password(employee_password_params)
      bypass_sign_in(@employee)
      redirect_to root_path, notice: t('.success')
    else
      render 'edit_password'
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params_with_password
    parameters = params.require(:employee).permit(:name,
                                                  :identification,
                                                  :email,
                                                  :position)
    parameters[:password] = Devise.friendly_token
    parameters
  end

  def employee_params
    params.require(:employee).permit(:name,
                                     :identification,
                                     :email,
                                     :position)
  end

  def employee_password_params
    params.require(:employee).permit(:password,
                                     :password_confirmation,
                                     :current_password)
  end
end
