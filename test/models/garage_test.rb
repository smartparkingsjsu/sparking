require 'test_helper'

class GarageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save garage without name" do
    garage = Garage.new
    assert_not garage.save
  end
end
