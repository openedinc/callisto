json.extract! caliper_event, :id, :payload, :time, :created_at, :updated_at
json.url caliper_event_url(caliper_event, format: :json)
