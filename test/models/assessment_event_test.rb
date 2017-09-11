require 'test_helper'

class AssessmentEventTest < ActiveSupport::TestCase

  test "should get paginated results" do
    assert AssessmentEvent.count > 1
    assert_equal(AssessmentEvent.page(1).per(1).size,1)
  end
end
