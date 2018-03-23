class Api::V1::AssessmentItemEventsController < Api::V1::BaseController

  # GET /assessment_item_events
  # GET /assessment_item_events.json
  def index
    @assessment_item_events = AssessmentItemEvent.search(
      actor_id: params[:actor_id],
      action: params[:action_name],
      edapp_id: params[:edapp_id],
      object_id: params[:object_id],
      generated_id: params[:generated_id],
      group_id: params[:group_id],
      is_part_of: params[:is_part_of],
      event_time: params[:event_time],
      generated_attempt_id: params[:generated_attempt_id]
    ).page(params[:page]).per(params[:per_page])

    render_paginated(@assessment_item_events)
  end
end
