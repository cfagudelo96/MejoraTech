class Complaint < ApplicationRecord
  enum classification: %i[complaint
                          suggestion
                          warranty
                          audit_result
                          deviation
                          nonconforming_product]

  enum company: %i[farmatech humax cambridge]

  enum status: %i[open extended closed]

  belongs_to :employee
  belongs_to :contact_employee, class_name: 'Employee', optional: true

  has_many :supports
  has_many :fishbone_analyses
  has_many :eight_ms_analyses

  validates :description, presence: true
  validates :source, presence: true
  validates :effective_date, presence: true
  validates :review_date, presence: true
  validates :code, presence: true, uniqueness: true
  validates :extended_count, numericality: { greater_than_or_equal_to: 0 }

  def product_name
    product_id.present? ? Product.find(product_id).to_s : I18n.t(:does_not_apply)
  rescue ActiveRecord::RecordNotFound
    I18n.t(:entity_not_found, entity: Product.model_name.human)
  end

  def assign_create_attributes
    self.status = :open
    self.code = "#{next_code_number}-#{Time.now.year}-#{company.humanize.first}"
  end

  def create_and_notify
    assign_create_attributes
    result = save
    notify_redirection if result
    result
  end

  def update_and_notify(params)
    old_employee_id = employee_id
    old_company = company
    result = update(params)
    if result
      notify_redirection(old_employee_id)
      change_company_code(old_company)
    end
    result
  end

  def notify_redirection(old_employee_id = nil)
    return unless redirection_mail_needed(old_employee_id)
    EmployeeMailer.complaint_redirected_email(self).deliver_later
  end

  def to_s
    code
  end

  private

  def change_company_code(old_company)
    return unless old_company != company
    code[code.length - 1] = company.humanize.first
    save
  end

  def next_code_number
    last_complaint = Complaint.where('code like ?', "%#{Time.now.year}%").order(:code).last
    if last_complaint.present?
      last_successive_number = last_complaint.code.split('-')[0].to_i
      successive_number = last_successive_number + 1
      successive_number.to_s.rjust(3, '0')
    else
      '001'
    end
  end

  def redirection_mail_needed(old_employee_id)
    old_employee_id.blank? ||
      (old_employee_id.present? && old_employee_id != employee_id)
  end
end
