module CaliperEventsHelper

    def action_from_event(event)
      p "Processing full payload #{event.payload.to_s}"
      payload_hash=JSON.parse(event.payload.to_s)
      p "Action is: #{payload_hash['data'][0]['action']}"
      payload_hash['data'][0]['action']
    end

end
