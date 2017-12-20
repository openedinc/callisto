json.assessment_item_events do
  json.array! @assessment_item_events, partial: 'assessment_item_events/assessment_item_event', as: :assessment_item_event
end

json.partial! 'pagination', page: @assessment_item_events
