task :test_message => :environment do
    
    @user = User.new(name: "Alberto", email: ENV["TEST_EMAIL"])

    TestNotifierMailer.test_booking_reminder(@user).deliver
end

task :test_text => :environment do

    @user = User.new(name: "Alberto", email: ENV["TEST_PHONE"])
    
    TestNotifierMailer.test_text_reminder(@user).deliver
end

task :booking_reminder => :environment do
    
  @bookings = Booking.where("start_time <= ?", Time.now + 1.day)

  @bookings.each do |booking|

    if ENV["TEST_ENV"] == "production"
      user = User.new(name: booking.user.name, email: booking.user.email)
    else
      user = User.new(name: booking.user.name, email: ENV["TEST_EMAIL"])
    end

    BookingNotifierMailer.send_booking_reminder(user, booking).deliver
  end
end

task :booking_end_reminder => :environment do
    
  @bookings = Booking.where("end_time <= ?", Time.now + 30.minutes)

  @bookings.each do |booking|
    if ENV["TEST_ENV"] == "production"
      user = User.new(name: booking.user.name, email: ENV["TEST_PHONE"])
    else
      user = User.new(name: booking.user.name, email: ENV["TEST_PHONE"])
    end

    BookingNotifierMailer.send_booking_end_reminder(user, booking).deliver
  end
end