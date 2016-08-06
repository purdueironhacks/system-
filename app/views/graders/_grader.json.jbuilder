json.extract! grader, :id, :name, :email, :grader_type, :created_at, :updated_at
json.url grader_url(grader, format: :json)