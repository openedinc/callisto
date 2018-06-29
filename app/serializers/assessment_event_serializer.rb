class AssessmentEventSerializer < BaseSerializer
  attributes :id,
    :actor_id,
    :action,
    :generated_id,
    :generated_started_at_time,
    :generated_ended_at_time,
    :event_time
end
