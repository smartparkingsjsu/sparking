task :test_message => :environment do
    puts "ALBERTO IS AWESOME"
    @bookings = Booking.all
end