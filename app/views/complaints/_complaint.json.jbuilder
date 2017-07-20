json.extract! complaint, :id, :product_id, :description, :employee_id, :classification, :source, :batch_number, :expiration_date, :effective_date, :pending, :review_date, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
