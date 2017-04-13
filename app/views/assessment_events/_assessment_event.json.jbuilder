json.extract! assessment_event, :id, :actorId, :action, :objectId, :generatedId, :generatedEndedAtTime, :created_at, :updated_at
json.url assessment_event_url(assessment_event, format: :json)
