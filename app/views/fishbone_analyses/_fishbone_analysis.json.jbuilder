json.extract! fishbone_analysis, :id, :complaint_id, :effect, :created_at, :updated_at
json.url complaint_fishbone_analyses_url(@complaint, fishbone_analysis, format: :json)
