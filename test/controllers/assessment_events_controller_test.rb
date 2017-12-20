require 'test_helper'

class AssessmentEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user(:admin)
    @auth_headers = @user.create_new_auth_token
    @assessment_event = assessment_events(:one)
  end

  test "should get index" do
    get assessment_events_url, headers: @auth_headers
    assert_response :success
  end

  test "should get new" do
    get new_assessment_event_url, headers: @auth_headers
    assert_response :success
  end

  test "should create assessment_event" do
    assert_difference('AssessmentEvent.count') do
      post assessment_events_url, params: { assessment_event: { action: "new action", actor_id: "new actor", generated_ended_at_time: Time.now, generated_id: "new generated id", object_id: "new object"} }, headers: @auth_headers
    end

    assert_redirected_to assessment_event_url(AssessmentEvent.last)
  end

  test "should show assessment_event" do
    get assessment_event_url(@assessment_event), headers: @auth_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_event_url(@assessment_event), headers: @auth_headers
    assert_response :success
  end

  test "should search event by event time" do
    event_date = "2017-04-13"
    get assessment_events_url, params: { event_time: event_date } ,headers: @auth_headers, as: :json
    resp = JSON.parse(response.body)["assessment_events"]
    assert_equal resp.count, 1
    assert_equal resp.first['event_time'].to_date.strftime("%Y-%m-%d"), event_date
    assert_response :success

    event_date = "2012-01-02"
    get assessment_events_url, params: { event_time: event_date } ,headers: @auth_headers, as: :json
    resp = JSON.parse(response.body)["assessment_events"]
    assert_equal resp.count, 0
    assert_response :success
  end



  test "should update assessment_event" do
    patch assessment_event_url(@assessment_event), params: { assessment_event: { action: @assessment_event.action, actor_id: @assessment_event.actor_id, generated_ended_at_time: @assessment_event.generated_ended_at_time, generated_id: @assessment_event.generated_id, object_id: @assessment_event.object_id } }, headers: @auth_headers
    assert_redirected_to assessment_event_url(@assessment_event)
  end

  test "should destroy assessment_event" do
    assert_difference('AssessmentEvent.count', -1) do
      delete assessment_event_url(@assessment_event), headers: @auth_headers
    end

    assert_redirected_to assessment_events_url
  end
end
