task :test_message => :environment do

    @user = User.new(name: "Alberto", email: "alexischeungho@gmail.com")

    BookingNotifierMailer.send_booking_reminder(@user).deliver
end