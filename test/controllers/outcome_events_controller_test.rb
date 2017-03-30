require 'test_helper'

class OutcomeEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outcome_event = outcome_events(:one)
  end

  test "should get index" do
    get outcome_events_url
    assert_response :success
  end

  test "should get new" do
    get new_outcome_event_url
    assert_response :success
  end

  test "should create outcome_event" do
    assert_difference('OutcomeEvent.count') do
      post outcome_events_url, params: { outcome_event: { action: @outcome_event.action, actorId: @outcome_event.actorId, assignableId: @outcome_event.assignableId, assignableIsPartOf: @outcome_event.assignableIsPartOf, assignableMaxScore: @outcome_event.assignableMaxScore, generatedId: @outcome_event.generatedId, generatedScoredBy: @outcome_event.generatedScoredBy, generatedTotalScore: @outcome_event.generatedTotalScore, objectId: @outcome_event.objectId } }
    end

    assert_redirected_to outcome_event_url(OutcomeEvent.last)
  end

  test "should show outcome_event" do
    get outcome_event_url(@outcome_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_outcome_event_url(@outcome_event)
    assert_response :success
  end

  test "should update outcome_event" do
    patch outcome_event_url(@outcome_event), params: { outcome_event: { action: @outcome_event.action, actorId: @outcome_event.actorId, assignableId: @outcome_event.assignableId, assignableIsPartOf: @outcome_event.assignableIsPartOf, assignableMaxScore: @outcome_event.assignableMaxScore, generatedId: @outcome_event.generatedId, generatedScoredBy: @outcome_event.generatedScoredBy, generatedTotalScore: @outcome_event.generatedTotalScore, objectId: @outcome_event.objectId } }
    assert_redirected_to outcome_event_url(@outcome_event)
  end

  test "should destroy outcome_event" do
    assert_difference('OutcomeEvent.count', -1) do
      delete outcome_event_url(@outcome_event)
    end

    assert_redirected_to outcome_events_url
  end
end
