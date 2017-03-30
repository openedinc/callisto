require 'test_helper'

class CaliperEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caliper_event = caliper_events(:one)
  end

  test "should get index" do
    get caliper_events_url
    assert_response :success
  end

  test "should get new" do
    get new_caliper_event_url
    assert_response :success
  end

  test "should create caliper_event" do
    assert_difference('CaliperEvent.count') do
      post caliper_events_url, params: { caliper_event: { payload: @caliper_event.payload, time: @caliper_event.time } }
    end

    assert_redirected_to caliper_event_url(CaliperEvent.last)
  end

  test "should show caliper_event" do
    get caliper_event_url(@caliper_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_caliper_event_url(@caliper_event)
    assert_response :success
  end

  test "should update caliper_event" do
    patch caliper_event_url(@caliper_event), params: { caliper_event: { payload: @caliper_event.payload, time: @caliper_event.time } }
    assert_redirected_to caliper_event_url(@caliper_event)
  end

  test "should destroy caliper_event" do
    assert_difference('CaliperEvent.count', -1) do
      delete caliper_event_url(@caliper_event)
    end

    assert_redirected_to caliper_events_url
  end
end
