class CaliperEvent < ApplicationRecord
  after_create :perform_route_worker

  def perform_route_worker
    RouteWorker.perform_async
  end
end
