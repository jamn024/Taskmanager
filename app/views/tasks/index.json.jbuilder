json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :user_id, :state
  json.url task_url(task, format: :json)
end
