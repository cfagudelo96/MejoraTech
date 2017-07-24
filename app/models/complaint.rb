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
  validates :review_date, presence: true

  def product_name
    product_id.present? ? Product.find(product_id).to_s : '-'
  rescue ActiveRecord::RecordNotFound
    'Product not found'
  end
end
