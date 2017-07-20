json.extract! employee, :id, :name, :identification, :email, :password, :position, :created_at, :updated_at
json.url employee_url(employee, format: :json)
