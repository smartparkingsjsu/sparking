require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save spot without name" do
    spot = Spot.new
    assert_not spot.save
  end

end
