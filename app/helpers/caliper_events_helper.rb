module CaliperEventsHelper

    def action_from_event(event)
      p "Processing full payload #{event.payload}"
      payload_hash=JSON.parse(event.payload.to_s)
      p "Action is: #{payload_hash['action']}"
      payload_hash["action"]
    end

end
