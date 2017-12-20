class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_employee!

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def restrict_access_to_admin
    redirect_to root_path, alert: I18n.t(:access_restricted) unless current_employee.admin
  end
end
