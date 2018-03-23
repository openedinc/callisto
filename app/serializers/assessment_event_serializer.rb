class AssessmentEventSerializer < ActiveModel::Serializer
  attributes :id,
    :actor_id,
    :action,
    :object_id,
    :generated_id,
    :generated_ended_at_time,
    :event_time
end
