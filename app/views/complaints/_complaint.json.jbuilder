json.extract! complaint, :id, :product_id, :description, :employee_id, :classification, :source, :batch_number, :expiration_date, :effective_date, :review_date, :created_at, :updated_at, :source_email, :source_contact_info, :contact_employee_id, :code, :company, :status
json.url complaint_url(complaint, format: :json)
