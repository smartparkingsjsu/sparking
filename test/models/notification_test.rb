require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save garage spot without id" do
    notification = Notification.new
    assert_not notification.save
  end
end
