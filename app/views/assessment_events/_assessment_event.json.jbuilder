json.extract! assessment_event, :id, :actor_id, :action, :object_id, :generated_id, :generated_ended_at_time, :created_at, :updated_at
json.url assessment_event_url(assessment_event, format: :json)
