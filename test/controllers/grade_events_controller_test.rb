require 'test_helper'

class GradeEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user(:admin)
    @auth_headers = @user.create_new_auth_token
    @grade_event = grade_events(:one)
  end

  test "should get index" do
    get grade_events_url, headers: @auth_headers
    assert_response :success
  end

  test "should get new" do
    get new_grade_event_url, headers: @auth_headers
    assert_response :success
  end

  test "should create grade_event" do
    assert_difference('GradeEvent.count') do
      post grade_events_url, params: { grade_event: { action: @grade_event.action, actor_id: @grade_event.actor_id, assignable_id: @grade_event.assignable_id, assignable_is_part_of: @grade_event.assignable_is_part_of, assignable_max_score: @grade_event.assignable_max_score, generated_id: @grade_event.generated_id, generated_scored_by: @grade_event.generated_scored_by, generated_total_score: @grade_event.generated_total_score, object_id: @grade_event.object_id } }, headers: @auth_headers
    end

    assert_redirected_to grade_event_url(GradeEvent.last)
  end

  test "should show grade_event" do
    get grade_event_url(@grade_event), headers: @auth_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_grade_event_url(@grade_event), headers: @auth_headers
    assert_response :success
  end

  test "should update grade_event" do
    patch grade_event_url(@grade_event), params: { grade_event: { action: @grade_event.action, actor_id: @grade_event.actor_id, assignable_id: @grade_event.assignable_id, assignable_is_part_of: @grade_event.assignable_is_part_of, assignable_max_score: @grade_event.assignable_max_score, generated_id: @grade_event.generated_id, generated_scored_by: @grade_event.generated_scored_by, generated_total_score: @grade_event.generated_total_score, object_id: @grade_event.object_id } }, headers: @auth_headers
    assert_redirected_to grade_event_url(@grade_event)
  end

  test "should destroy grade_event" do
    assert_difference('GradeEvent.count', -1) do
      delete grade_event_url(@grade_event), headers: @auth_headers
    end

    assert_redirected_to grade_events_url
  end
end
