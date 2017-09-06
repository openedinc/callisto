class OutcomeEventsController < ApplicationController
  before_action :set_outcome_event, only: [:show, :edit, :update, :destroy]

  # GET /outcome_events
  # GET /outcome_events.json
=begin
Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* object_assignable - the ID of the assessment, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/0011"
* generated ID - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
=end
  def index
    @outcome_events = OutcomeEvent.search(
      actor_id: params[:actor_id],
      object_id: params[:object_id],
      object_assignable: params[:object_assignable],
      generated_id: params[:generated_id]
    )
  end

  # GET /outcome_events/1
  # GET /outcome_events/1.json
  def show
  end

  # GET /outcome_events/new
  def new
    @outcome_event = OutcomeEvent.new
  end

  # GET /outcome_events/1/edit
  def edit
  end

  # POST /outcome_events
  # POST /outcome_events.json
  def create
    @outcome_event = OutcomeEvent.new(outcome_event_params)

    respond_to do |format|
      if @outcome_event.save
        format.html { redirect_to @outcome_event, notice: 'Outcome event was successfully created.' }
        format.json { render :show, status: :created, location: @outcome_event }
      else
        format.html { render :new }
        format.json { render json: @outcome_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcome_events/1
  # PATCH/PUT /outcome_events/1.json
  def update
    respond_to do |format|
      if @outcome_event.update(outcome_event_params)
        format.html { redirect_to @outcome_event, notice: 'Outcome event was successfully updated.' }
        format.json { render :show, status: :ok, location: @outcome_event }
      else
        format.html { render :edit }
        format.json { render json: @outcome_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcome_events/1
  # DELETE /outcome_events/1.json
  def destroy
    @outcome_event.destroy
    respond_to do |format|
      format.html { redirect_to outcome_events_url, notice: 'Outcome event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome_event
      @outcome_event = OutcomeEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcome_event_params
      params.require(:outcome_event).permit(:actor_id, :action, :object_id, :assignable_id, :assignable_max_score, :assignable_is_part_of, :generated_id, :generated_total_score, :generated_scored_by)
    end
end
