require "rails_helper"

RSpec.describe Api::V1::GradeEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/grade_events").to route_to("api/v1/grade_events#index")
    end
  end
end
