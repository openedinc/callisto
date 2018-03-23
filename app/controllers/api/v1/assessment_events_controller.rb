class Api::V1::AssessmentEventsController < Api::V1::BaseController

  # GET /assessment_events
  # GET /assessment_events.json
  def index
    @assessment_events = AssessmentEvent.search(
      actor_id: params[:actor_id],
      action: params[:action_name],
      edapp_id: params[:edapp_id],
      object_id: params[:object_id],
      generated_id: params[:generated_id],
      group_id: params[:group_id]
    ).page(params[:page]).per(params[:per_page])

    render_paginated(@assessment_events)
  end
end
