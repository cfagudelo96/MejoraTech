class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]
  before_action :restrict_access_to_admin, except: %i[edit_password update_password]

  def index
    if request.format == 'xlsx'
      @employees = Employee.all
    else
      @filterrific = initialize_filterrific(Employee, params[:filterrific])
      return unless @filterrific
      @employees = @filterrific.find.page(params[:page])
    end
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

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_path, notice: t('.success') }
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
                                                  :position,
                                                  :admin)
    parameters[:password] = Devise.friendly_token(8)
    parameters
  end

  def employee_params
    params.require(:employee).permit(:name,
                                     :identification,
                                     :email,
                                     :position,
                                     :admin)
  end

  def employee_password_params
    params.require(:employee).permit(:password,
                                     :password_confirmation,
                                     :current_password)
  end
end
