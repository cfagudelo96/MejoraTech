class EmployeeMailer < ApplicationMailer
  def complaint_redirected_email(complaint)
    @employee = complaint.employee
    @complaint = complaint
    mail(to: @employee.email, subject: t('.subject'))
  end
end
