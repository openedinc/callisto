class AssessmentItemEventSerializer < BaseSerializer
  attributes :id,
    :actor_id,
    :action,
    :max_score,
    :is_part_of,
    :generated_attempt_id,
    :generated_id,
    :generated_score,
    :generated_count,
    :generated_started_at_time,
    :generated_ended_at_time,
    :event_time
end
