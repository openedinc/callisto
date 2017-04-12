class AssessmentItemEventsController < ApplicationController
  before_action :set_assessment_item_event, only: [:show, :edit, :update, :destroy]

  # GET /assessment_item_events
  # GET /assessment_item_events.json
  # allow query by follow params:
  #     "actor_id"
  #     "action"
  #     "object_id"
  #     "generated_id"
  def index
    @assessment_item_events = AssessmentItemEvent.search(
      actor_id: params[:actor_id],
      action: params[:action],
      generated_id: params[:generated_id],
      object_id: params[:object_id]
    )
  end

  # GET /assessment_item_events/1
  # GET /assessment_item_events/1.json
  def show
  end

  # GET /assessment_item_events/new
  def new
    @assessment_item_event = AssessmentItemEvent.new
  end

  # GET /assessment_item_events/1/edit
  def edit
  end

  # POST /assessment_item_events
  # POST /assessment_item_events.json
  def create
    @assessment_item_event = AssessmentItemEvent.new(assessment_item_event_params)

    respond_to do |format|
      if @assessment_item_event.save
        format.html { redirect_to @assessment_item_event, notice: 'Assessment item event was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_item_event }
      else
        format.html { render :new }
        format.json { render json: @assessment_item_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_item_events/1
  # PATCH/PUT /assessment_item_events/1.json
  def update
    respond_to do |format|
      if @assessment_item_event.update(assessment_item_event_params)
        format.html { redirect_to @assessment_item_event, notice: 'Assessment item event was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_item_event }
      else
        format.html { render :edit }
        format.json { render json: @assessment_item_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_item_events/1
  # DELETE /assessment_item_events/1.json
  def destroy
    @assessment_item_event.destroy
    respond_to do |format|
      format.html { redirect_to assessment_item_events_url, notice: 'Assessment item event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_item_event
      @assessment_item_event = AssessmentItemEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_item_event_params
      params
        .require(:assessment_item_event)
        .permit(
          :actor_id,
          :action,
          :object_id,
          :max_score,
          :is_part_of,
          :generated_id,
          :generated_count,
          :generated_started_at_time
        )
    end
end
