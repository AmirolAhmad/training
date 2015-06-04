desc 'Booking Status'
task check_booking_status: :environment do
  Booking.all.each(&:overdue)
end