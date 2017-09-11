require 'test_helper'

class MediaEventTest < ActiveSupport::TestCase

  test "should get paginated results" do
    assert MediaEvent.count > 1
    assert_equal(MediaEvent.page(1).per(1).size,1)
  end
end
