require 'test_helper'

class AssessmentEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_event = assessment_events(:one)
  end

  test "should get index" do
    get assessment_events_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_event_url
    assert_response :success
  end

  test "should create assessment_event" do
    assert_difference('AssessmentEvent.count') do
      post assessment_events_url, params: { assessment_event: { action: @assessment_event.action, actorId: @assessment_event.actorId, generatedEndedAtTime: @assessment_event.generatedEndedAtTime, generatedId: @assessment_event.generatedId, objectId: @assessment_event.objectId } }
    end

    assert_redirected_to assessment_event_url(AssessmentEvent.last)
  end

  test "should show assessment_event" do
    get assessment_event_url(@assessment_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_event_url(@assessment_event)
    assert_response :success
  end

  test "should update assessment_event" do
    patch assessment_event_url(@assessment_event), params: { assessment_event: { action: @assessment_event.action, actorId: @assessment_event.actorId, generatedEndedAtTime: @assessment_event.generatedEndedAtTime, generatedId: @assessment_event.generatedId, objectId: @assessment_event.objectId } }
    assert_redirected_to assessment_event_url(@assessment_event)
  end

  test "should destroy assessment_event" do
    assert_difference('AssessmentEvent.count', -1) do
      delete assessment_event_url(@assessment_event)
    end

    assert_redirected_to assessment_events_url
  end
end
