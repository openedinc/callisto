class Api::V1::GradeEventsController < Api::V1::BaseController

  # GET /grade_events
  # GET /grade_events.json
  def index
    @grade_events = GradeEvent.search(
      actor_id: params[:actor_id],
      edapp_id: params[:edapp_id],
      object_id: params[:object_id],
      object_assignable: params[:object_assignable],
      generated_id: params[:generated_id]
    ).page(params[:page]).per(params[:per_page])

    render_paginated(@grade_events)
  end
end
