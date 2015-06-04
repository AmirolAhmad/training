desc 'User Status'
task check_user_status: :environment do
  User.all.each(&:check_status)
end