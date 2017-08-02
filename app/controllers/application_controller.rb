class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_employee!

  protected

  def restrict_access_to_admin
    redirect_to root_path, alert: "You don't have permission to access this functionality." unless current_employee.admin
  end
end
