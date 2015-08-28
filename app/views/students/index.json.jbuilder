json.array!(@students) do |student|
  json.extract! student, :id, :name, :age, :status, :major, :year
  json.url student_url(student, format: :json)
end
