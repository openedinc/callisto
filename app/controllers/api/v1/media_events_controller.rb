class Api::V1::MediaEventsController < Api::V1::BaseController

  # GET /media_events
  # GET /media_events.json
  def index
    @media_events = MediaEvent.search(
      actor_id: params[:actor_id],
      action: params[:action_name],
      edapp_id: params[:edapp_id],
      object_id: params[:object_id],
      group_id: params[:group_id]
    ).page(params[:page]).per(params[:per_page])

    render_paginated(@media_events)
  end
end
