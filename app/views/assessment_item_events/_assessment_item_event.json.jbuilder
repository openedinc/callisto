json.extract! assessment_item_event, :id, :actor_id, :action, :object_id, :max_score, :is_part_of, :generated_id, :generated_score, :generated_count, :generated_started_at_time, :created_at, :updated_at
json.url assessment_item_event_url(assessment_item_event, format: :json)
