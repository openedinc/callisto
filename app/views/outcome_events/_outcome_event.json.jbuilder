json.extract! outcome_event, :id, :actor_id, :action, :object_id, :assignable_id, :assignable_max_score, :assignable_is_part_of, :generated_id, :generated_total_score, :generated_scored_by, :created_at, :updated_at
json.url outcome_event_url(outcome_event, format: :json)
