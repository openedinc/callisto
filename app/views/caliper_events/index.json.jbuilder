json.caliper_events do
  json.array! @caliper_events, partial: 'caliper_events/caliper_event', as: :caliper_event
end

json.partial! 'pagination', page: @caliper_events unless @without_pagination
