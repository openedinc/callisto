module CaliperEventsHelper

    def action_from_event(event)
      p "Processing #{event.payload}"
      payload_hash=JSON.parse(event.payload)
      p "Processing #{payload_hash['action']}"
      payload_hash["action"]
    end

end
