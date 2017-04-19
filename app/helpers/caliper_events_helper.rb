module CaliperEventsHelper

    def action_from_event(event)
      p "Processing full payload #{event.payload.to_s}"
      payload_hash=JSON.parse(event.payload.to_s)
      p "Action is: #{payload_hash['data'][0]['action']}"
      payload_hash['data'][0]['action']
    end

    def object_from_event
      p "Processing full payload #{event.payload.to_s}"
      payload_hash=JSON.parse(event.payload.to_s)
      p "Action is: #{payload_hash['data'][0]['object']}"
      payload_hash['data'][0]['object']
    end

    def actor_from_event
      p "Processing full payload #{event.payload.to_s}"
      payload_hash=JSON.parse(event.payload.to_s)
      p "Action is: #{payload_hash['data'][0]['actor']}"
      payload_hash['data'][0]['actor']
    end
end
