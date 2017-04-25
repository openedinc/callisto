class AssessmentEventsController < ApplicationController
  before_action :set_assessment_event, only: [:show, :edit, :update, :destroy]


=begin
search based on these arguments
  actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
action - what happened with the assessment, e.g."http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
object_id - the ID of the assessment, e.g. "https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264"
generated_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
=end
  def index
    @assessment_events = AssessmentEvent.search(
      actor_id: params[:actor_id],
      action: params[:action],
      object_id: params[:object_id],
      generated_id: params[:generated_id])
  end

  # GET /assessment_events/1
  # GET /assessment_events/1.json
  def show
  end

  # GET /assessment_events/new
  def new
    @assessment_event = AssessmentEvent.new
  end

  # GET /assessment_events/1/edit
  def edit
  end

  # POST /assessment_events
  # POST /assessment_events.json
  def create
    @assessment_event = AssessmentEvent.new(assessment_event_params)

    respond_to do |format|
      if @assessment_event.save
        format.html { redirect_to @assessment_event, notice: 'Assessment event was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_event }
      else
        format.html { render :new }
        format.json { render json: @assessment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_events/1
  # PATCH/PUT /assessment_events/1.json
  def update
    respond_to do |format|
      if @assessment_event.update(assessment_event_params)
        format.html { redirect_to @assessment_event, notice: 'Assessment event was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_event }
      else
        format.html { render :edit }
        format.json { render json: @assessment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_events/1
  # DELETE /assessment_events/1.json
  def destroy
    @assessment_event.destroy
    respond_to do |format|
      format.html { redirect_to assessment_events_url, notice: 'Assessment event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_event
      @assessment_event = AssessmentEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_event_params
      params.require(:assessment_event).permit(:actor_id, :action, :object_id, :generated_id, :generated_ended_at_time)
    end
end
