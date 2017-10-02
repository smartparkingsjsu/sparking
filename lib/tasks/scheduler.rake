task :test_message => :environment do
    command "echo 'ALBERTO IS AWESOME'"
    @bookings = Booking.all
end