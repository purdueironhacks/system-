json.extract! grade, :id, :project_id, :grader_id, :usability_score, :technical_score, :phase, :created_at, :updated_at
json.url grade_url(grade, format: :json)