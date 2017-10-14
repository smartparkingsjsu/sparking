task :test_message => :environment do

    @user = User.new(name: "Alberto", email: "alexischeungho@gmail.com")

    TestNotifierMailer.test_booking_reminder(@user).deliver
end

task :booking_reminder => :environment do
    
    @bookings = Booking.where("start_time <= ?", Time.now + 1.day)

    @bookings.each do |booking|
        user = User.new(name: booking.user.name, email: "alexischeungho@gmail.com")
        BookingNotifierMailer.send_booking_reminder(user, booking).deliver
    end
end