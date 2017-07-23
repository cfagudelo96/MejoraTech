class Complaint < ApplicationRecord
  enum classification: [:complaint,
                        :suggestion,
                        :warranty,
                        :audit_result,
                        :deviation,
                        :nonconforming_product]

  belongs_to :employee

  validates :description, presence: true
  validates :source, presence: true
  validates :effective_date, presence: true
end
