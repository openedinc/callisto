require "rails_helper"

RSpec.describe Api::V1::AssessmentItemEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/assessment_item_events").to route_to("api/v1/assessment_item_events#index")
    end
  end
end
