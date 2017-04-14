class CaliperEvent < ApplicationRecord

  after_save :perform_route_worker

  def perform_route_worker
    RouteWorker.perform_async
  end
end
