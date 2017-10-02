class CaliperEvent < ApplicationRecord
  after_create :perform_route_worker

  def self.build_batch(events_params)
    events_params.map do |event_params|
      self.new(event_params.slice(:payload))
    end
  end

  def perform_route_worker
    RouteWorker.perform_async(self.id)
  end
end
