class CaliperEvent < ApplicationRecord

  def after_save(record)
    RouteWorker.new.perform_async
  end
end
