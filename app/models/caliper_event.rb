class CaliperEvent < ApplicationRecord

  after_save :perform_route_worker

  def perform_route_worker(record)
    RouteWorker.new.perform_async
  end
end
