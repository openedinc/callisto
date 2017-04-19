module CaliperEventsHelper

    def action_from_event(event)
      payload_hash=JSON.parse(event.payload)
      payload_hash["action"]
    end

end
