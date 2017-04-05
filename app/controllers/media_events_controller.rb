class MediaEventsController < ApplicationController
  before_action :set_media_event, only: [:show, :edit, :update, :destroy]

  # GET /media_events
  # GET /media_events.json
  def index
    @media_events = MediaEvent.all
  end

  # GET /media_events/1
  # GET /media_events/1.json
  def show
  end

  # GET /media_events/new
  def new
    @media_event = MediaEvent.new
  end

  # GET /media_events/1/edit
  def edit
  end

  # POST /media_events
  # POST /media_events.json
  def create
    @media_event = MediaEvent.new(media_event_params)

    respond_to do |format|
      if @media_event.save
        format.html { redirect_to @media_event, notice: 'Media event was successfully created.' }
        format.json { render :show, status: :created, location: @media_event }
      else
        format.html { render :new }
        format.json { render json: @media_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_events/1
  # PATCH/PUT /media_events/1.json
  def update
    respond_to do |format|
      if @media_event.update(media_event_params)
        format.html { redirect_to @media_event, notice: 'Media event was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_event }
      else
        format.html { render :edit }
        format.json { render json: @media_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_events/1
  # DELETE /media_events/1.json
  def destroy
    @media_event.destroy
    respond_to do |format|
      format.html { redirect_to media_events_url, notice: 'Media event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_event
      @media_event = MediaEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_event_params
      params.require(:media_event).permit(:actor_id, :action, :object_id)
    end
end
