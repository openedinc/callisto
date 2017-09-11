class GradeEventsController < ApplicationController
  before_action :set_grade_event, only: [:show, :edit, :update, :destroy]

  # GET /grade_events
  # GET /grade_events.json
=begin
Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* object_assignable - the ID of the assessment, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/0011"
* generated ID - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
=end
  def index
    @grade_events = GradeEvent.search(
      actor_id: params[:actor_id],
      object_id: params[:object_id],
      object_assignable: params[:object_assignable],
      generated_id: params[:generated_id]
    ).page(page_params)
  end

  # GET /grade_events/1
  # GET /grade_events/1.json
  def show
  end

  # GET /grade_events/new
  def new
    @grade_event = GradeEvent.new
  end

  # GET /grade_events/1/edit
  def edit
  end

  # POST /grade_events
  # POST /grade_events.json
  def create
    @grade_event = GradeEvent.new(grade_event_params)

    respond_to do |format|
      if @grade_event.save
        format.html { redirect_to @grade_event, notice: 'grade event was successfully created.' }
        format.json { render :show, status: :created, location: @grade_event }
      else
        format.html { render :new }
        format.json { render json: @grade_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_events/1
  # PATCH/PUT /grade_events/1.json
  def update
    respond_to do |format|
      if @grade_event.update(grade_event_params)
        format.html { redirect_to @grade_event, notice: 'grade event was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade_event }
      else
        format.html { render :edit }
        format.json { render json: @grade_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_events/1
  # DELETE /grade_events/1.json
  def destroy
    @grade_event.destroy
    respond_to do |format|
      format.html { redirect_to grade_events_url, notice: 'grade event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_event
      @grade_event = GradeEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_event_params
      params.require(:grade_event).permit(:actor_id, :action, :object_id, :assignable_id, :assignable_max_score, :assignable_is_part_of, :generated_id, :generated_total_score, :generated_scored_by)
    end
end
