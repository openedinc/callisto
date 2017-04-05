json.extract! media_event, :id, :actor_id, :action, :object_id, :created_at, :updated_at
json.url media_event_url(media_event, format: :json)
