json.extract! request, :id, :fullname, :student_number, :document, :request_reason, :created_at, :updated_at
json.url request_url(request, format: :json)
