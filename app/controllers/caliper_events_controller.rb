class CaliperEventsController < ApplicationController
  include CaliperEventsHelper
  before_action :set_caliper_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, if: :api_request?
  # GET /caliper_events
  # GET /caliper_events.json
  def index
    @caliper_events = CaliperEvent.order(:created_at)
  end

  # GET /caliper_events/1
  # GET /caliper_events/1.json
  def show
    @action=action_from_event(@caliper_event)
  end

  # GET /caliper_events/new
  def new
    @caliper_event = CaliperEvent.new
  end

  # GET /caliper_events/1/edit
  def edit
  end

  # POST /caliper_events
  # POST /caliper_events.json
  def create
    @caliper_event = CaliperEvent.new(payload: caliper_event_params['payload'])

    respond_to do |format|
      if @caliper_event.save
        format.html { redirect_to @caliper_event, notice: 'Caliper event was successfully created.' }
        format.json { render :show, status: :created, location: @caliper_event }
      else
        format.html { render :new }
        format.json { render json: @caliper_event.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /caliper_events/1
  # PATCH/PUT /caliper_events/1.json
  def update
    respond_to do |format|
      if @caliper_event.update(caliper_event_params)
        format.html { redirect_to @caliper_event, notice: 'Caliper event was successfully updated.' }
        format.json { render :show, status: :ok, location: @caliper_event }
      else
        format.html { render :edit }
        format.json { render json: @caliper_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caliper_events/1
  # DELETE /caliper_events/1.json
  def destroy
    @caliper_event.destroy
    respond_to do |format|
      format.html { redirect_to caliper_events_url, notice: 'Caliper event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caliper_event
      @caliper_event = CaliperEvent.find(params[:id])
    end

    def api_request?
      request.format.json? || request.format.xml?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caliper_event_params
      params.require(:caliper_event).permit(:payload, :time)
    end
end
