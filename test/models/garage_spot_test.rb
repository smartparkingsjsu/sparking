require 'test_helper'

class GarageSpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save garage spot without id" do
    garage_spot = GarageSpot.new
    assert_not garage_spot.save
  end
end
