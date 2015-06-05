### How To

##### Update booking status [important]
This apps has cron job running when in staging or production mode for every 1 minute. If you are in development environment, you need to run `rake check_booking_status` for each time to check the booking status whether still in active or already expired.

##### Update user status [important]
This apps has cron job running when in staging or production mode for every 1 minute. If you are in development environment, you need to run `rake check_user_status` for each time to check the user status whether still in active or suspend.

### Technology that I use

1. Rails 4.2.1
2. Ruby 2.2.2
3. MySQL

### Type of user

1. Admin[0]
2. User[1]
3. Supploer[2]

##### User has status

1. Active[0]
2. Suspend[1]

### Type of Item

1. Returnable[0]
2. Not Returnable[1]

### Type of booking

1. Active[0]
2. Closed[1]
3. Expired[2]