require 'test_helper'

class AssessmentItemEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_item_event = assessment_item_events(:one)
  end

  test "should get index" do
    get assessment_item_events_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_item_event_url
    assert_response :success
  end

  test "should create assessment_item_event" do
    assert_difference('AssessmentItemEvent.count') do
      post assessment_item_events_url, params: { assessment_item_event: { action: @assessment_item_event.action, actorId: @assessment_item_event.actorId, generatedCount: @assessment_item_event.generatedCount, generatedId: @assessment_item_event.generatedId, generatedStartedAtTime: @assessment_item_event.generatedStartedAtTime, isPartOf: @assessment_item_event.isPartOf, maxScore: @assessment_item_event.maxScore, objectId: @assessment_item_event.objectId } }
    end

    assert_redirected_to assessment_item_event_url(AssessmentItemEvent.last)
  end

  test "should show assessment_item_event" do
    get assessment_item_event_url(@assessment_item_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_item_event_url(@assessment_item_event)
    assert_response :success
  end

  test "should update assessment_item_event" do
    patch assessment_item_event_url(@assessment_item_event), params: { assessment_item_event: { action: @assessment_item_event.action, actorId: @assessment_item_event.actorId, generatedCount: @assessment_item_event.generatedCount, generatedId: @assessment_item_event.generatedId, generatedStartedAtTime: @assessment_item_event.generatedStartedAtTime, isPartOf: @assessment_item_event.isPartOf, maxScore: @assessment_item_event.maxScore, objectId: @assessment_item_event.objectId } }
    assert_redirected_to assessment_item_event_url(@assessment_item_event)
  end

  test "should destroy assessment_item_event" do
    assert_difference('AssessmentItemEvent.count', -1) do
      delete assessment_item_event_url(@assessment_item_event)
    end

    assert_redirected_to assessment_item_events_url
  end
end
