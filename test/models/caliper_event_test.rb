require 'test_helper'

class CaliperEventTest < ActiveSupport::TestCase

  test "should get paginated results" do
    assert CaliperEvent.count > 1
    assert_equal(CaliperEvent.page(1).per(1).size,1)
  end
end
