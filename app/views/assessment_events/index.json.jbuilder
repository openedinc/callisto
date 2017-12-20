json.assessment_events do
  json.array! @assessment_events, partial: 'assessment_events/assessment_event', as: :assessment_event
end

json.partial! 'pagination', page: @assessment_events
