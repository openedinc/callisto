json.media_events do
  json.array! @media_events, partial: 'media_events/media_event', as: :media_event
end

json.partial! 'pagination', page: @media_events
