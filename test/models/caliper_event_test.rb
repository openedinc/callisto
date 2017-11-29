require 'test_helper'

class CaliperEventTest < ActiveSupport::TestCase

  test "should get paginated results" do
    assert CaliperEvent.count > 1
    assert_equal(CaliperEvent.page(1).per(1).size,1)
  end

  test "should build a batch of new records" do
    params = 2.times.map do
      {
        data: { test_payload_key: "test_payload_value" }
      }
    end

    records = CaliperEvent.build_batch(params)
    assert_equal records.length, 2
    assert_equal records.count(&:new_record?), 2
  end
end
