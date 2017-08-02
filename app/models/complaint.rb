class Complaint < ApplicationRecord
  enum classification: [:complaint,
                        :suggestion,
                        :warranty,
                        :audit_result,
                        :deviation,
                        :nonconforming_product]

  enum company: [:farmatech, :humax, :cambridge]

  enum status: [:researching, :reviewing, :closed]

  belongs_to :employee
  belongs_to :contact_employee, class_name: 'Employee', optional: true

  validates :description, presence: true
  validates :source, presence: true
  validates :effective_date, presence: true
  validates :review_date, presence: true
  validates :code, presence: true, uniqueness: true

  def product_name
    product_id.present? ? Product.find(product_id).to_s : 'Does not apply'
  rescue ActiveRecord::RecordNotFound
    'Product not found'
  end

  def assign_create_attributes
    self.status = :researching
    self.code = "#{next_code_number}-#{Time.now.year}-#{company.humanize.first}"
  end

  def to_s
    code
  end

  private

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
end
