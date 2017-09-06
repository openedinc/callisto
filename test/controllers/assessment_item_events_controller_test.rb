require 'test_helper'

class AssessmentItemEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user(:admin)
    @auth_headers = @user.create_new_auth_token
    @assessment_item_event = assessment_item_events(:one)
  end

  test "should get index" do
    get assessment_item_events_url, headers: @auth_headers
    assert_response :success
  end

  test "should get new" do
    get new_assessment_item_event_url, headers: @auth_headers
    assert_response :success
  end

  test "should create assessment_item_event" do
    assert_difference('AssessmentItemEvent.count') do
      post assessment_item_events_url, params: { assessment_item_event: { action: @assessment_item_event.action, actor_id: @assessment_item_event.actor_id, generated_count: @assessment_item_event.generated_count, generated_id: @assessment_item_event.generated_id, generated_started_at_time: @assessment_item_event.generated_started_at_time, is_part_of: @assessment_item_event.is_part_of, max_score: @assessment_item_event.max_score, object_id: @assessment_item_event.object_id } }, headers: @auth_headers
    end

    assert_redirected_to assessment_item_event_url(AssessmentItemEvent.last)
  end

  test "should show assessment_item_event" do
    get assessment_item_event_url(@assessment_item_event), headers: @auth_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_item_event_url(@assessment_item_event), headers: @auth_headers
    assert_response :success
  end

  test "should update assessment_item_event" do
    patch assessment_item_event_url(@assessment_item_event), params: { assessment_item_event: { action: @assessment_item_event.action, actor_id: @assessment_item_event.actor_id, generated_count: @assessment_item_event.generated_count, generated_id: @assessment_item_event.generated_id, generated_started_at_time: @assessment_item_event.generated_started_at_time, is_part_of: @assessment_item_event.is_part_of, max_score: @assessment_item_event.max_score, object_id: @assessment_item_event.object_id } }, headers: @auth_headers
    assert_redirected_to assessment_item_event_url(@assessment_item_event)
  end

  test "should destroy assessment_item_event" do
    assert_difference('AssessmentItemEvent.count', -1) do
      delete assessment_item_event_url(@assessment_item_event), headers: @auth_headers
    end

    assert_redirected_to assessment_item_events_url
  end
end
