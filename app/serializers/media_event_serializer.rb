class MediaEventSerializer < BaseSerializer
  attributes :id,
    :actor_id,
    :action,
    :generated_started_at_time,
    :generated_ended_at_time,
    :created_at,
    :updated_at
end
