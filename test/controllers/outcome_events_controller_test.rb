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
      post outcome_events_url, params: { outcome_event: { action: @outcome_event.action, actor_id: @outcome_event.actor_id, assignable_id: @outcome_event.assignable_id, assignableis_part_of: @outcome_event.assignableis_part_of, assignablemax_score: @outcome_event.assignablemax_score, generated_id: @outcome_event.generated_id, generated_scored_by: @outcome_event.generated_scored_by, generated_total_score: @outcome_event.generated_total_score, object_id: @outcome_event.object_id } }
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
    patch outcome_event_url(@outcome_event), params: { outcome_event: { action: @outcome_event.action, actor_id: @outcome_event.actor_id, assignable_id: @outcome_event.assignable_id, assignableis_part_of: @outcome_event.assignableis_part_of, assignablemax_score: @outcome_event.assignablemax_score, generated_id: @outcome_event.generated_id, generated_scored_by: @outcome_event.generated_scored_by, generated_total_score: @outcome_event.generated_total_score, object_id: @outcome_event.object_id } }
    assert_redirected_to outcome_event_url(@outcome_event)
  end

  test "should destroy outcome_event" do
    assert_difference('OutcomeEvent.count', -1) do
      delete outcome_event_url(@outcome_event)
    end

    assert_redirected_to outcome_events_url
  end
end
