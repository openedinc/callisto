json.grade_events do
  json.array! @grade_events, partial: 'grade_events/grade_event', as: :grade_event
end

json.partial! 'pagination', page: @grade_events
