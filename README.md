### How To

##### Update booking status
This apps has cron job running when in staging or production mode for every 1 minute. If you are in development environment, you need to run `rake check_booking_status` to check the booking status whether still in active or already expired.

##### Update user status
This apps has cron job running when in staging or production mode for every 1 minute. If you are in development environment, you need to run `rake check_user_status` to check the user status whether still in active or suspend.