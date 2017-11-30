require 'test_helper'

class CaliperEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user(:admin)
    @auth_headers = @user.create_new_auth_token
    @caliper_event = caliper_events(:assessment_event)
    @media_event_item = caliper_events(:media_event_item)
  end

  test "should get index" do
    get caliper_events_url, params:{}, headers: @auth_headers
    assert_response :success
  end

  test "should get new" do
    get new_caliper_event_url, params:{}, headers: @auth_headers
    assert_response :success
  end

  test "should create caliper_event" do
    assert_difference('CaliperEvent.count') do
      post caliper_events_url, params: { caliper_event: { data: @caliper_event.payload, time: @caliper_event.time } }, headers: @auth_headers
    end

    assert_redirected_to caliper_event_url(CaliperEvent.last)
  end

  test "should create caliper_event from media event" do
    assert_difference('CaliperEvent.count') do
      post caliper_events_url, "params": { "caliper_event": { "data": @media_event_item.payload, "eventTime": @media_event_item.time } }, headers: @auth_headers
    end

    assert_redirected_to caliper_event_url(CaliperEvent.last)
  end

  test "should create many caliper_event records from a batch request" do
    payload = [@caliper_event, @media_event_item].map do |event|
      {
        data: event.payload, eventTime: event.time
      }
    end

    assert_difference('CaliperEvent.count', 2) do
      post batch_caliper_events_url, params: { caliper_events: payload }, headers: @auth_headers, as: :json
    end

    assert_response :created
  end

  test "should show caliper_event" do
    get caliper_event_url(@caliper_event), params:{}, headers: @auth_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_caliper_event_url(@caliper_event), params:{}, headers: @auth_headers
    assert_response :success
  end

  test "should update caliper_event" do
    patch caliper_event_url(@caliper_event), params: { caliper_event: { data: @caliper_event.payload, time: @caliper_event.time } }, headers: @auth_headers
    assert_redirected_to caliper_event_url(@caliper_event)
  end

  test "should destroy caliper_event" do
    assert_difference('CaliperEvent.count', -1) do
      delete caliper_event_url(@caliper_event), headers: @auth_headers
    end

    assert_redirected_to caliper_events_url
  end
end
