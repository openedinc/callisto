require 'test_helper'

class AssessmentItemEventTest < ActiveSupport::TestCase
  test "should get paginated results" do
    assert AssessmentItemEvent.count > 1
    assert_equal(AssessmentItemEvent.page(1).per(1).size,1)
  end
end
